<template>
  <v-card>
    <v-card-title class="justify-space-between ">
      <span class="text-h4">{{ event.eventname }}</span>
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
        <v-divider></v-divider>
        <v-container>
          <v-card-text class="text-h5" >参加メンバー一覧</v-card-text>
          <ul>
            <li
              v-for="join in joins"
              :key="join.id"
            >
            <span>
              {{join.user.name}}
            </span>
            </li>
          </ul>
              <v-card-actions>
                <v-btn
                  color="blue"
                  text
                  outlined
                  @click="$emit('closeDialog')"
                >
                  閉じる
                </v-btn>
                <v-btn
                  v-if="isjoin()"
                  color="primary"
                  @click="deleteJoin"
                >
                  参加済
                </v-btn>
                <v-btn
                  v-else
                  color="blue"
                  text
                  outlined
                  @click="sendJoin"
                >
                  参加
                </v-btn>
              </v-card-actions>
        </v-container>
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
import ClickEvent from "~/components/menu/eventsearch/ClickEvent.vue"

export default {
  components: {
    ClickEvent,
  },
  data() {
    return {
      content: '',
      join:    '',
      joins:  [],
      dialog: false,
      defaultImg: require("@/assets/images/default_user_icon.jpeg")
    }
  },
  props: ["event"],

  mounted() {
    this.fetchJoin()
  },

  methods: {
    async fetchJoin() {
      const joins = `http://localhost:3000/api/v1/joins`
      const response = await this.$axios.get(joins, {params: {event_id: this.event.id}})
      this.joins = response.data
    },
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
    sendJoin() {
      this.$axios
        .post('/api/v1/joins' , {event_id: this.event.id})
        .then(() => {
          this.fetchJoin()
          setTimeout(() => {
            this.$store.dispatch(
              "flashMessage/showMessage",
              {
                message: "参加しました.",
                type: "sucess",
                status: true,
              },
              { root: true }
            )
          },1000)
        })
    },
    deleteJoin() {
      const joins = this.joins.find(join => join.user.id == this.$auth.user.id);
      this.$axios
        .delete(`/api/v1/joins/${joins.id}`)
        .then(() => {
          this.fetchJoin()
          setTimeout(() => {
            this.$store.dispatch(
              "flashMessage/showMessage",
              {
                message: "参加をキャンセルしました.",
                type: "sucess",
                status: true,
              },
              { root: true }
            )
          },1000)
        })
    },
    isjoin() {
      const join = this.joins.find(join => join.user_id == this.$auth.user.id);
      return join !== undefined
    },
  }
}
</script>