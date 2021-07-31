<template>
  <v-container class="mx-auto" >
    <v-list-item
      v-for="event in events"
      :key="event.id"
    >
      <v-row class="mt-8">
        <v-col cols="10">
          <v-card color="gray" class="px-6">
            <h2 class="pb-4">
              {{ event.eventname }}
              <h6 class="float-right d-inline">ユーザー名：{{ event.user.name }}</h6>
            </h2>
            <h4 class="d-inline">
              開催日時:{{ $moment(event.datetime).format('YYYY年MM月DD日 HH時mm分') }}
            </h4>
            <h4 class="d-inline float-right">
              開催市区:{{ event.cityward }}
            </h4>
          </v-card>
        </v-col>
        <v-col cols="2">
          <v-avatar size="80">
            <v-img v-if="image == null" :src="defaultImg" />
            <v-img v-else :src="image" />
          </v-avatar>
        </v-col>
      </v-row>
    </v-list-item>
    <infinite-loading 
      ref="infiniteLoading" 
      spinner="spiral"
      @infinite="infiniteHandler">
      <div slot="no-results"/>
    </infinite-loading>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      count:       10,
      event:     '',
      events:    '',
      defaultImg: require("@/assets/images/default_user_icon.jpeg")
    }
  },
  mounted () {
    this.fetchEvent()
  },
  computed: {
    image() {
      const hoge = this.$store.getters['image/imagedate']
      return hoge
    },
  },
  methods: {
    async fetchEvent(get) {
      const events = 'http://localhost:3000/api/v1/events'
      console.log(events)
      const response = await this.$axios.get(events, get)
      this.events = response.data
    },
    infiniteHandler() {
      setTimeout(() => {
        if (this.count < 100) {
          this.count += 20
          this.$refs.infiniteLoading.stateChanger.loaded()
        } else {
          this.$refs.infiniteLoading.stateChanger.complete()
        }
      }, 500)
    }
  }
}
</script>