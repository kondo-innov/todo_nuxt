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
      <v-tab @click="openPlan">
        自分のつぶやき(工事中)
        <v-icon>mdi-calendar-clock</v-icon>
      </v-tab>
      <v-tab @click="openPastPost">
        自分の投稿イベント(工事中)
        <v-icon>mdi-clock-time-eight</v-icon>
      </v-tab>
      <v-tab @click="openPastParticipation">
        参加イベント(工事中)
        <v-icon>mdi-magnify</v-icon>
      </v-tab>
    </v-tabs>
    <v-row justify="center">
      <v-col cols="12" md="10" sm="10"> </v-col>
    </v-row>
    <v-tabs-items v-model="tab" touchless>
      <v-tab-item>
        <Plan v-if="Plan" />
      </v-tab-item>
      <v-tab-item>
        <PastPost v-if="PastPost" />
      </v-tab-item>
      <v-tab-item>
        <PastParticipation v-if="PastParticipation" />
      </v-tab-item>
    </v-tabs-items>
  </v-container>
</template>

<script>
import Plan from "~/components/menu/eventschedule/Plan.vue"
import PastPost from "~/components/menu/eventschedule/PastPost.vue"
import PastParticipation from "~/components/menu/eventschedule/PastParticipation.vue"

export default {
  components: {
    Plan,
    PastPost,
    PastParticipation,
  },
  data() {
    return {
      tab: null,
      Plan: true,
      PastPost: false,
      PastParticipation: false,
    }
  },
  methods: {
    openPlan() {
      ;(this.Plan = true),
        (this.PastPost = false),
        this.PastParticipation = false
    },
    openPastPost() {
      ;(this.Plan = false),
        this.PastPost = true,
        this.PastParticipation = false
    },
    openPastParticipation() {
      ;(this.Plan = false),
        (this.PastPost = false),
        this.PastParticipation = true
    },
  },
}
</script>
