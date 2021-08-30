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
      <v-tab @click="opennewtweetList">
        新着順
        <v-icon>mdi-clock-time-eight</v-icon>
      </v-tab>
      <v-tab @click="opengoodtweetList">
        いいね
        <v-icon>mdi-thumb-up</v-icon>
      </v-tab>
      <v-tab @click.stop="opentweetPost">
        つぶやき投稿
        <v-icon>mdi-file-send</v-icon>
      </v-tab>
    </v-tabs>
    <v-tabs-items
      v-model="tab"
      touchless
    >
      <v-tab-item>
        <newtweetList v-if="shownewtweetList" />
      </v-tab-item>
      <v-tab-item>
        <goodtweetList v-if="showgoodtweetList" />
      </v-tab-item>
      <v-dialog
        v-if="tweetpostingPage"
        v-model="dialog"
        max-width="600px"
        activator
      >
        <v-tab-item>
          <tweetpostingPage @closeDialog="dialog = false" />
        </v-tab-item>
      </v-dialog>
    </v-tabs-items>
  </v-container>
</template>

<script>
import newtweetList from '~/components/menu/tweetList/newtweetList.vue';
import goodtweetList from '~/components/menu/tweetList/goodtweetList.vue';
import tweetpostingPage from '~/components/menu/post/tweetpostingPage.vue';

export default {
  components: {
    newtweetList,
    goodtweetList,
    tweetpostingPage,
  },
  data() {
    return {
      dialog: false,
      tab: null,
      shownewtweetList: true,
      showgoodtweetList: false,
      tweetpostingPage: false,
    };
  },
  methods: {
    opennewtweetList() {
      this.shownewtweetList = true,
      this.showgoodtweetList = false,
      this.tweetpostingPage = false;
    },
    opengoodtweetList() {
      this.shownewtweetList = false,
      this.showgoodtweetList = true,
      this.tweetpostingPage = false;
    },
    opentweetPost() {
      this.shownewtweetList = false,
      this.showgoodtweetList = false,
      this.tweetpostingPage = true,
      this.dialog = true;
    },
  },
};
</script>
