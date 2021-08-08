<template>
  <v-container class="mx-auto">
    <v-list-item
      v-for="event in events"
      :key="event.id"
    >
      <ForEvent 
        :event ="event"
      />
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
import ForEvent    from "~/components/menu/eventsearch/ForEvent.vue"

export default {
  components: {
    ForEvent,
  },
  data() {
    return {
      count:       10,
      event:     '',
      events:    [],
      defaultImg: require("@/assets/images/default_user_icon.jpeg"),
      dialog: false
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
      const response = await this.$axios.get(events, get)
      this.events = response.data.events
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