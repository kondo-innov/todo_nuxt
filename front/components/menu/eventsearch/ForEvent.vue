<template>
  <v-row class="mt-8">
    <v-col cols="10">
      <v-card
        color="gray"
        class="px-6"
        width="600px"
        @click.stop="dialog = true"
      >
        <h2 class="pb-4">
          {{ event.eventname }}
          <h6 class="float-right d-inline">ユーザー名：{{ event.name }}</h6>
        </h2>
        <h4 class="d-inline">
          開催日時:{{
            $moment(event.datetime).format("YYYY年MM月DD日 HH時mm分")
          }}
        </h4>
        <h4 class="d-inline float-right">開催市区:{{ event.cityward }}</h4>
        <v-dialog
          v-model="dialog"
          hide-overlay
          persistent
          max-width="600px"
          activator
          :retain-focus="false"
        >
          <ShowEvent
            :event="event"
            @closeDialog="dialog = false"
            @eventdelete="$listeners['eventdelete']"
          />
        </v-dialog>
      </v-card>
      <div class="float-right">
        <template v-if="event.user_id === $auth.user.id">
          <EditEvent
            :event="event"
            @eventdelete="$listeners['eventdelete']"
            @closeDialog="dialog = false"
          />
          <v-btn icon text color="grey darken-2" @click="sendDelete(event.id)">
            <v-icon> mdi-delete </v-icon>
          </v-btn>
        </template>
      </div>
    </v-col>
    <v-col cols="2">
      <v-avatar size="80">
        <v-img v-if="event.image == null" :src="defaultImg" />
        <v-img v-else :src="event.image" />
      </v-avatar>
    </v-col>
  </v-row>
</template>

<script>
import ShowEvent from "~/components/menu/eventsearch/ShowEvent.vue"
import EditEvent from "~/components/menu/eventsearch/EditEvent.vue"

export default {
  components: {
    ShowEvent,
    EditEvent,
  },
  props: ["event"],
  data() {
    return {
      dialog: false,
      defaultImg: require("@/assets/images/default_user_icon.jpeg"),
    }
  },

  methods: {
    sendDelete(id) {
      this.$axios
        .delete(`/api/v1/events/${id}`)
        .then(() => {
          this.$emit("eventdelete", this.event)
          this.$emit("closeDialog")
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
          }, 1000)
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
          }, 1000)
        })
    },
  },
}
</script>
