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
      <v-tab
        @click="opennewEvent"
      >
        新着順
        <v-icon>mdi-clock-time-eight</v-icon>
      </v-tab>
      <v-tab
        @click="openSearch"
      >
        イベント検索
        <v-icon>mdi-magnify</v-icon>
      </v-tab>
    </v-tabs>
    <v-row justify="center">
      <v-col cols="12" md="10" sm="10">
      </v-col>
    </v-row>
    <v-tabs-items v-model="tab" touchless>
      <v-tab-item>
        <newEvent 
          v-if="newEvent"
        />
      </v-tab-item>
      <v-tab-item>
        <Search v-if="Search"
        />
      </v-tab-item>
    </v-tabs-items>
  </v-container>
</template>

<script>
import newEvent       from "~/components/menu/eventsearch/newEvent.vue"
import Search         from "~/components/menu/eventsearch/Search.vue"

export default {
  components: {
    newEvent,
    Search,
  },
  data () {
    return {
      tab:                 null,
      newEvent:            true,
      Search:              false,
    }
  },
  methods: {
    opennewEvent () {
      console.log('a')
      this.newEvent       = true,
      this.Search         = false
    },
    openSearch () {
      console.log('b')
      this.newEvent       = false,
      this.Search         = true
    },
  }
}
</script>