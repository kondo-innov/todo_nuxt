<template>
  <v-container>
     <v-row justify="center" class="mt-6">
      <v-col xl="2" lg="3" sm="8" cols="12">
        <side-menu
          @opentweetList="opentweetList"
        />
      </v-col>
      <v-col xl="5" lg="7" sm="8" cols="12">

      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import sideMenu  from "~/components/menu/sideMenu.vue"
import tweetList from "~/components/menu/tweetList.vue"
export default {

  components: {
    sideMenu,
    tweetList,
  },
  data () {
    return {
    }
  },
  methods: {
    // メインコンテンツ表示切り替え関連
    opentweetList () {
      this.tweetList = true
    },
  }
}
</script>