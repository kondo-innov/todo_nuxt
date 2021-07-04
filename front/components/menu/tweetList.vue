<template>
  <v-container>
    <v-tabs
      fixed-tabs
      centered
      background-color="cyan darken-1"
      color="white"
      slider-color="orange"
      icons-and-text
    >
      <v-tab
        @change="newtweetList"
        class="ma-0 pa-0"
      >
        新着順
        <v-icon>mdi-clock-time-eight</v-icon>
      </v-tab>
      <v-tab
        @change="goodtweetList"
        class="ma-0 pa-0"
      >
        いいね
        <v-icon>mdi-thumb-up</v-icon>
      </v-tab>
      <v-tab
        class="ma-0 pa-0"
      >
        自分のつぶやき
        <v-icon>mdi-comment-account-outline</v-icon>
      </v-tab>
    </v-tabs>
    <v-row justify="center">
      <v-col cols="12" md="10" sm="10">
        <v-btn
          class="mt-2"
          to="/"
          block
          color="primary"
          elevation="2"
          large
          rounded
          x-large
          >つぶやきはこちらから</v-btn>
      </v-col>
    </v-row>
    <v-tabs-items v-model="tab" touchless>
      <v-tab-item>
        <newtweetList />
      </v-tab-item>
      <v-tab-item>
        <goodtweetList />
      </v-tab-item>
      <v-tab-item>
        
      </v-tab-item>
    </v-tabs-items>
  </v-container>
</template>

<script>
import newtweetList  from "~/components/menu/tweetList/newtweetList.vue"
import goodtweetList from "~/components/menu/tweetList/goodtweetList.vue"

export default {
  components: {
    newtweetList,
    goodtweetList,
  },
  data () {
    return {
      tab: null
    }
  },
  methods: {
    newtweetList () {
      this.newtweetList = !this.newtweetList
    },
    goodtweetList () {
      this.goodtweetList = !this.goodtweetList
    },
  }
}
</script>