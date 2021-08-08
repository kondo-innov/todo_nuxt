<template>
  <v-container>
    <v-tabs
      v-model="tab"
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
    <v-row justify="center" class="my-2">
      <v-col cols="12" md="10" sm="10">
        <tweetpostingPage />
      </v-col>
    </v-row>
    <v-tabs-items v-model="tab" touchless>
      <v-tab-item>
        <newtweetList 
          v-if="shownewtweetList"
        />
      </v-tab-item>
      <v-tab-item>
        <goodtweetList v-if="showgoodtweetList"
        />
      </v-tab-item>
      <v-tab-item>
        <mytweetList v-if="showmytweetList"
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
      tweetpostingPage:        false,
      tab:                     null,
      shownewtweetList:        true,
      showgoodtweetList:       false,
      showmytweetList:         false
    }
  },
  methods: {
    opentweetpostingPage () {
      this.tweetpostingPage  = true
    },
    opennewtweetList () {
      console.log('a')
      this.shownewtweetList      = true,
      this.showgoodtweetList     = false,
      this.showmytweetList       = false
    },
    opengoodtweetList () {
      console.log('b')
      this.shownewtweetList      = false,
      this.showgoodtweetList     = true,
      this.showmytweetList       = false
    },
    openmytweetList () {
      console.log('c')
      this.shownewtweetList      = false,
      this.showgoodtweetList     = false,
      this.showmytweetList       = true
    },
  }
}
</script>