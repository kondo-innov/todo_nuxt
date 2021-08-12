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
                  <v-row class="pt-4 pl-3">
                    <v-icon>mdi-camera</v-icon>
                    <span>つぶやき画像</span>
                  </v-row>
                  <v-row justify="center" class="pt-6">
                    <v-avatar tile size="200">
                      <img :src="image">
                    </v-avatar>
                    <v-col cols="12">
                      <input
                        v-if="view"
                        accept="image/png, image/jpeg, image/bmp"
                        prepend-icon="mdi-image"
                        label="画像を選択してください"
                        class="pt-14"
                        id="image-files"
                        type="file"
                        @change="addPicture"
                      />
                    </v-col>
                  </v-row>
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
import TweetDescription    from "~/components/menu/post/tweetpostingpage/TweetDescription.vue"

export default {
  components: {
    TweetDescription
  },
  data() {
    return {
      dialog: false,
      picture: [],
      image:   [],
      description:  '',
      view: true
    }
  },

  props: ["value"],

  methods: {
    addPicture(e) {
      e.preventDefault();
      const picture = e.target.files[0];
      this.image = picture
      this.upload()
      this.picture = picture
    },
    async upload() {
      const reader = new FileReader()
      reader.readAsDataURL(this.image)
      reader.addEventListener('load', () => {
        this.image = reader.result
      })
    },
    tweetPost() {
      const formData = new FormData()
      formData.append("picture", this.picture)
      formData.append("description", this.description)
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
          this.image =             [],
          this.description=      '',
          this.dialog = false
          this.view = false
          this.$nextTick(function () {
            this.view = true
          })
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