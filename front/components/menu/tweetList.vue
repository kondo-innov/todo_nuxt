<template>
  <v-container>
    <v-tabs
      fixed-tabs
      centered
      background-color="cyan darken-1"
      color="white"
      slider-color="orange"
      icons-and-text
    >
      <v-tab>
        新着順
        <v-icon>mdi-clock-time-eight</v-icon>
      </v-tab>
      <v-tab>
        いいね
        <v-icon>mdi-thumb-up</v-icon>
      </v-tab>
      <v-tab>
        自分のつぶやき
        <v-icon>mdi-comment-account-outline</v-icon>
      </v-tab>
    </v-tabs>
    <v-row justify="center">
      <v-col cols="12" md="10" sm="10">
        <v-btn
          class="mt-2"
          to="/"
          block
          color="primary"
          elevation="2"
          large
          rounded
          x-large
          >つぶやきはこちらから</v-btn>
      </v-col>
    </v-row>
    <v-tabs-items v-model="tab" touchless>
      <v-tab-item>
        <v-card flat>
          <v-card-text>
            <newtweetList v-if="newtweetList"
            />
          </v-card-text>
        </v-card>
      </v-tab-item>
      <v-tab-item>
        <v-card flat>
          <v-card-text>
            <goodtweetList v-if="goodtweetList"
            />
          </v-card-text>
        </v-card>
      </v-tab-item>
      <v-tab-item>
        <v-card flat>
          <v-card-text>
            <mytweetList v-if="mytweetList"
            />
          </v-card-text>
        </v-card>
      </v-tab-item>
    </v-tabs-items>
  </v-container>
</template>

<script>
import newtweetList  from "~/components/menu/tweetList/newtweetList.vue"
import goodtweetList from "~/components/menu/tweetList/goodtweetList.vue"
import mytweetList   from "~/components/menu/tweetList/mytweetList.vue"

export default {
  components: {
    newtweetList,
    goodtweetList,
    mytweetList,
  },
  data () {
    return {
      tab:                 null,
      newtweetList:        true,
      goodtweetList:       false,
      mytweetList:         false
    }
  },
  methods: {
    newtweetList () {
      console.log('a')
      this.newtweetList = !this.newtweetList
    },
    goodtweetList () {
      console.log('b')
      this.goodtweetList = !this.goodtweetList
    },
    mytweetList () {
      console.log('c')
      this.mytweetList = !this.mytweetList
    },
  }
}
</script>