<template>
  <v-container class="mx-auto">
    <v-list-item
      v-for="tweet in tweets"
      :key="tweet.id"
    >
      <ForTweet
        :tweet="tweet"
        :likes="likes"
        @comment="fetchTweet"
        @fetchlike="fetchLike"
      />
    </v-list-item>
    <infinite-loading
      ref="infiniteLoading"
      spinner="spiral"
      @infinite="infiniteHandler"
    >
      <div slot="no-results" />
    </infinite-loading>
  </v-container>
</template>

<script>
import ForTweet from '~/components/menu/tweetList/ForTweet.vue';

export default {
  components: {
    ForTweet,
  },
  data() {
    return {
      tweets: [],
      tweet: '',
      likes: [],
    };
  },
  mounted() {
    this.fetchTweet();
    this.fetchLike();
  },

  methods: {
    async fetchTweet() {
      const tweets = 'https://todonuxt-api.herokuapp.com/api/v1/like_lists';
      const response = await this.$axios.get(tweets, {
        params: { user_id: this.$auth.user.id },
      });
      this.tweets = response.data.tweets;
    },
    async fetchLike(get) {
      const likes = 'https://todonuxt-api.herokuapp.com/api/v1/likes';
      const response = await this.$axios.get(likes, get);
      this.likes = response.data;
    },
    infiniteHandler() {
      setTimeout(() => {
        if (this.count < 100) {
          this.count += 20;
          this.$refs.infiniteLoading.stateChanger.loaded();
        } else {
          this.$refs.infiniteLoading.stateChanger.complete();
        }
      }, 1000);
    },
  },
};
</script>
