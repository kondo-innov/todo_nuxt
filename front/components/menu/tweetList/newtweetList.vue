<template>
  <v-container class="mx-auto">
    <v-list-item
      v-for="tweet in tweets"
      :key="tweet.id"
    >
      <ForTweet
        :tweet ="tweet"
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
import ForTweet    from "~/components/menu/tweetList/ForTweet.vue"

export default {
  components: {
    ForTweet,
  },
  data() {
    return {
      tweets:   [],
      tweet:    '',
    }
  },
  mounted() {
    this.fetchTweet()
  },

  methods: {
    async fetchTweet(get) {
      const tweets = 'http://localhost:3000/api/v1/tweets'
      const response = await this.$axios.get(tweets, get)
      this.tweets = response.data.tweets
    },
    infiniteHandler() {
      setTimeout(() => {
        if (this.count < 100) {
          this.count += 20
          this.$refs.infiniteLoading.stateChanger.loaded()
        } else {
          this.$refs.infiniteLoading.stateChanger.complete()
        }
      }, 1000)
    }
  }

}
</script>