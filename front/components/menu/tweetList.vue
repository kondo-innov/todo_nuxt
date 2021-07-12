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
        @click="opennewtweetList"
      >
        新着順
        <v-icon>mdi-clock-time-eight</v-icon>
      </v-tab>
      <v-tab
        @click="opengoodtweetList"
      >
        いいね
        <v-icon>mdi-thumb-up</v-icon>
      </v-tab>
      <v-tab
        @click="openmytweetList"
      >
        自分のつぶやき
        <v-icon>mdi-comment-account-outline</v-icon>
      </v-tab>
    </v-tabs>
    <v-row justify="center">
      <v-col cols="12" md="10" sm="10">
        <tweetpostingPage />
      </v-col>
    </v-row>
    <v-tabs-items v-model="tab" touchless>
      <v-tab-item>
        <newtweetList 
          v-if="newtweetList"
        />
      </v-tab-item>
      <v-tab-item>
        <goodtweetList v-if="goodtweetList"
        />
      </v-tab-item>
      <v-tab-item>
        <mytweetList v-if="mytweetList"
        />
      </v-tab-item>
    </v-tabs-items>
  </v-container>
</template>

<script>
import newtweetList       from "~/components/menu/tweetList/newtweetList.vue"
import goodtweetList      from "~/components/menu/tweetList/goodtweetList.vue"
import mytweetList        from "~/components/menu/tweetList/mytweetList.vue"
import tweetpostingPage   from "~/components/menu/post/tweetpostingPage.vue"

export default {
  components: {
    newtweetList,
    goodtweetList,
    mytweetList,
    tweetpostingPage,
  },
  data () {
    return {
      tweetpostingPage:    false,
      tab:                 null,
      newtweetList:        true,
      goodtweetList:       false,
      mytweetList:         false
    }
  },
  methods: {
    opentweetpostingPage () {
      this.tweetpostingPage  = true
    },
    opennewtweetList () {
      console.log('a')
      this.newtweetList      = true,
      this.goodtweetList     = false,
      this.mytweetList       = false
    },
    opengoodtweetList () {
      console.log('b')
      this.newtweetList      = false,
      this.goodtweetList     = true,
      this.mytweetList       = false
    },
    openmytweetList () {
      console.log('c')
      this.newtweetList      = false,
      this.goodtweetList     = false,
      this.mytweetList       = true
    },
  }
}
</script>