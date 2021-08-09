<template>
  <v-row class="mt-8">
    <v-col cols="12">
      <v-card color="gray" position: relative>
        <span>
          <v-avatar size="80">
            <v-img v-if="tweet.image == null" :src="defaultImg" />
            <v-img v-else :src="tweet.image" />
          </v-avatar>
          <h2 class="name">
            {{ tweet.name }}<br>
            投稿日時:{{ $moment(tweet.created_at).format('YYYY年MM月DD日 HH時mm分') }}
          </h2>
        </span>
        <v-row>
          <v-col cols="12">
            <h4 class="mt-6 ml-2">
              {{ tweet.description }}
            </h4>
          </v-col>
        </v-row>
        <v-row justify="center">
          <v-avatar tile size="150">
            <v-img :src="tweet.picture" />
          </v-avatar>
        </v-row>
        <div>
          <v-row justify="end" class="mt-8 mr-6">
            <!-- <v-btn
              icon
              text
              color="grey darken-2"
            >
              <v-icon>
                mdi-pencil-box-multiple
              </v-icon>
            </v-btn> -->
            <v-btn
              icon
              text
              color="grey darken-2"
              @click="sendDelete(tweet.id)"
            >
              <v-icon>
                mdi-delete
              </v-icon>
            </v-btn>
            <v-btn
              icon
              text
              color="grey darken-2"
              @click="openCommentDialog"
            >
              <v-icon>
                mdi-comment-outline
              </v-icon>
            </v-btn>
            <v-btn
              icon
              text
              color="grey darken-2"
              @click="sendGood"
            >
              <v-icon>
                mdi-heart-outline
              </v-icon>
            </v-btn>
          </v-row>
        </div>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data() {
    return {
      defaultImg: require("@/assets/images/default_user_icon.jpeg"),
      loading: false,
    }
  },
  props: ["tweet"],

  methods: {
    sendDelete(id) {
      this.$axios.delete(`/api/v1/tweets/${id}`)
      .then(() => {
        this.$emit("tweetdelete", this.tweet);
        this.loading = true
        console.log(this.loading)
        setTimeout(() => {
          this.$store.dispatch(
            "flashMessage/showMessage",
            {
              message: "削除に成功しました.",
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
              message: "削除に失敗しました.",
              type: "sucess",
              status: true,
            },
            { root: true }
          )
        },1000)
      })
    },
    openCommentDialog() {
      console.log('comment')
    },
    sendGood() {
      console.log('good')
    },
  },
}
</script>

<style>
.name {
  display: inline-block;
  text-align: center;
  position: absolute;
  top:10px;
  left: 100px;
}
</style>