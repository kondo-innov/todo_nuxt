<template>
  <v-card>
    <v-card-title class="justify-space-between ">
      <span class="text-h4">{{ event.eventname }}</span>
        <div>
          <v-btn
            class="mr-4"
            icon
            text
            color="grey darken-2"
          >
            <v-icon>
              mdi-cog
            </v-icon>
          </v-btn>
          <v-btn
            icon
            text
            color="grey darken-2"
            @click= "sendDelete(event.id)" 
          >
            <v-icon>
              mdi-delete
            </v-icon>
          </v-btn>
        </div>
    </v-card-title>
    <v-divider></v-divider>
    <v-card-text>
      <v-container>
        <v-card-text class="text-h5" >開催日時:{{ $moment(event.datetime).format('YYYY年MM月DD日 HH時mm分') }}</v-card-text>
        <v-divider></v-divider>
        <v-card-text class="text-h5">開催市区:{{ event.cityward }}</v-card-text>
        <v-divider></v-divider>
        <v-card-text class="text-h5">開催地:{{ event.streetaddress }}</v-card-text>
        <v-divider></v-divider>
        <v-card-text class="text-h6">イベント内容:</v-card-text>
        <v-card-text class="text-h5">{{ event.description }}</v-card-text>
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
          >
            参加
          </v-btn>
        </v-card-actions>
        <v-divider></v-divider>
      </v-container>
      <v-container>
        <v-card-text class="text-h5" >コメント一覧</v-card-text>
        <v-row>
          <v-list-item
            v-for="comment in event.comment"
            :key="comment.id"
          >
            <v-col cols="10"> 
              {{comment.content}}
            </v-col>
            <v-col cols="2">
              <v-btn
                icon
                text
                color="grey darken-2"
                @click="commentDelete(comment.id)"
              >
                <v-icon>
                  mdi-delete
                </v-icon>
              </v-btn>
            </v-col>
          </v-list-item>
        </v-row>
        <form>
          <v-row class="footer">
            <v-col cols="9" class="ml-8">
              <v-text-field
                v-model="content"
                :counter="50"
                label="コメント"
                dense
              ></v-text-field>
            </v-col>
            <v-col cols="2">
              <v-btn
                color="blue darken-1"
                text
                outlined
                @click="sendcontent"
              >
                Save
              </v-btn>
            </v-col>
          </v-row>
        </form>
      </v-container>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      content: '',
      defaultImg: require("@/assets/images/default_user_icon.jpeg")
    }
  },
  props: ["event"],

  methods: {
    sendcontent() {
      const formData = new FormData()
      formData.append("content", this.content)
      formData.append("event_id", this.event.id)
      const config = {
        headers: {
          "content-type": "multipart/form-data",
        },
      }
      this.$axios
        .post('/api/v1/event_comments', formData, config)
        .then(() => {
          console.log('投稿に成功しました')
          this.content=        '',
          this.$emit("eventdelete", this.event)
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
    commentDelete(id) {
      this.$axios.delete(`/api/v1/event_comments/${id}`)
      .then(() => {
        this.$emit("eventdelete", this.event)
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
    sendDelete(id) {
      this.$axios.delete(`/api/v1/events/${id}`)
      .then(() => {
        this.$emit("eventdelete", this.event);
        this.$emit('closeDialog')
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
  }
}
</script>