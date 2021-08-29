<template>
  <v-container>
    <v-row justify="center">
      <v-card>
        <v-form>
          <ValidationObserver v-slot="ObserverProps">
            <v-card-title>
              <span class="text-h5">イベント投稿</span>
            </v-card-title>
            <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12">
                    <eventName v-model="eventname" rules="max:20|required" />
                  </v-col>
                  <v-col cols="12">
                    <dateTime v-model="datetime" rules="required" />
                  </v-col>
                  <v-col cols="4">
                    <cityWard v-model="cityward" rules="required" />
                  </v-col>
                  <v-flex offset-xs0 xs8>
                    <streetAddress v-model="streetaddress" rules="required" />
                  </v-flex>
                  <v-col cols="12">
                    <Description
                      v-model="description"
                      rules="max:1000|required"
                    />
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="$emit('closeDialog')">
                閉じる
              </v-btn>
              <v-btn
                :disabled="ObserverProps.invalid"
                color="blue darken-1"
                text
                @click="eventPost"
              >
                送信
              </v-btn>
            </v-card-actions>
          </ValidationObserver>
        </v-form>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import eventName from "~/components/menu/post/eventpostingPage/eventName.vue"
import dateTime from "~/components/menu/post/eventpostingPage/dateTime.vue"
import cityWard from "~/components/menu/post/eventpostingPage/cityWard.vue"
import streetAddress from "~/components/menu/post/eventpostingPage/streetAddress.vue"
import Description from "~/components/menu/post/eventpostingPage/Description.vue"

export default {
  components: {
    eventName,
    dateTime,
    cityWard,
    streetAddress,
    Description,
  },
  props: ["value"],
  data() {
    return {
      dialog: false,
      eventname: "",
      datetime: "",
      cityward: "",
      streetaddress: "",
      description: "",
    }
  },

  methods: {
    eventPost() {
      const formData = new FormData()
      formData.append("eventname", this.eventname)
      formData.append("datetime", this.datetime)
      formData.append("cityward", this.cityward)
      formData.append("streetaddress", this.streetaddress)
      formData.append("description", this.description)
      const config = {
        headers: {
          "content-type": "multipart/form-data",
        },
      }
      this.$axios
        .post("/api/v1/events", formData, config)
        .then((res) => {
          console.log("投稿に成功しました")
          this.$emit("eventPost", res)
          this.$emit("closeDialog")
          ;(this.eventname = ""),
            (this.datetime = ""),
            (this.cityward = ""),
            (this.streetaddress = ""),
            (this.description = ""),
            setTimeout(() => {
              this.$store.dispatch(
                'flashMessage/showMessage',
                {
                  message: "投稿に成功しました.",
                  type: "sucess",
                  status: true,
                },
                { root: true }
              )
            }, 1000)
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
          }, 1000)
        })
    },
  },
}
</script>
