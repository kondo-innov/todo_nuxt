<template>
  <v-container>
    <v-row justify="center" class="mt-6">
      <v-col xl="2" lg="3" sm="4" cols="12">
        <side-menu
          @opentweetList="opentweetList"
          @openeventsearch="openeventsearch"
          @openeventschedule="openeventschedule"
        />
      </v-col>
      <v-col xl="5" lg="7" sm="8" cols="12" class="menu_list">
        <tweetList v-if="tweetList" />
        <eventsearch v-if="eventsearch" />
        <eventschedule v-if="eventschedule" />
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import sideMenu from "~/components/menu/sideMenu.vue"
import tweetList from "~/components/menu/tweetList.vue"
import eventsearch from "~/components/menu/eventsearch.vue"
import eventschedule from "~/components/menu/eventschedule.vue"
export default {
  components: {
    sideMenu,
    tweetList,
    eventsearch,
    eventschedule,
  },
  data() {
    return {
      tweetList: true,
      eventsearch: false,
      eventschedule: false,
    }
  },
  methods: {
    // メインコンテンツ表示切り替え関連
    opentweetList() {
      this.tweetList = true
      this.eventsearch = false
      this.eventschedule = false
    },
    openeventsearch() {
      this.tweetList = false
      this.eventsearch = true
      this.eventschedule = false
    },
    openeventschedule() {
      this.tweetList = false
      this.eventsearch = false
      this.eventschedule = true
    },
  },
}
</script>

<style>
.menu_list {
  padding: 0;
}
</style>
