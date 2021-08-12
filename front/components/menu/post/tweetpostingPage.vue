<template>
    <v-card>
      <v-form>
        <v-card-title class="cyan darken-1" flat>
          <span class="text-h4 white--text">投稿する</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12">
                <TweetPicture 
                  @setPicture="setPicture"
                />
              </v-col>
              <v-col cols="12">
                <TweetDescription 
                  v-model="description"
                />
              </v-col>
            </v-row>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="blue darken-1"
            text
            @click="$emit('closeDialog')"
          >
            閉じる
          </v-btn>
          <v-btn
            color="blue darken-1"
            text
            @click="tweetPost"
          >
            送信
          </v-btn>
        </v-card-actions>
      </v-form>
    </v-card>
</template>

<script>
import TweetPicture    from "~/components/menu/post/tweetpostingpage/TweetPicture.vue"
import TweetDescription    from "~/components/menu/post/tweetpostingpage/TweetDescription.vue"

export default {
  components: {
    TweetPicture,
    TweetDescription
  },
  data() {
    return {
      dialog: false,
      picture: [],
      description:  '',
    }
  },

  props: ["value"],

  methods: {
    tweetPost() {
      const formData = new FormData()
      formData.append("picture", this.picture)
      formData.append("description", this.description)
      console.log(this.picture)
      const config = {
        headers: {
          "content-type": "multipart/form-data",
        },
      }
      this.$axios
        .post('/api/v1/tweets', formData, config)
        .then((res) => {
          console.log('投稿に成功しました')
          this.$emit('tweetPost', res)
          this.$emit('closeDialog')
          this.picture=            [],
          this.description=      '',
          this.dialog = false
          setTimeout(() => {
            this.$store.dispatch(
              "flashMessage/showMessage",
              {
                message: "投稿に成功しました.",
                type: "sucess",
                status: true,
              },
              { root: true }
            )
          },1000)
        })
        .catch((err) => {
          setTimeout(() => {
            this.$store.dispatch(
              "flashMessage/showMessage",
              {
                message: "投稿に失敗しました.",
                type: "sucess",
                status: true,
              },
              { root: true }
            )
          },1000)
        })
    },
    setPicture (payload) {
      this.picture = payload
    },
  }
}
</script>