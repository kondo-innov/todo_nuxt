<template>
  <v-container class="mx-auto">
    <v-list-item
      v-for="event in events"
      :key="event.id"
    >
      <ForEvent
        :event="event"
        @eventdelete="fetchEvent"
      />
    </v-list-item>
    <infinite-loading
      ref="infiniteLoading"
      spinner="spiral"
      @infinite="infiniteHandler"
    >
      <div slot="no-results" />
    </infinite-loading>
  </v-container>
</template>

<script>
import ForEvent from '~/components/menu/eventsearch/ForEvent.vue';

export default {
  components: {
    ForEvent,
  },
  data() {
    return {
      count: 10,
      event: '',
      events: [],
      dialog: false,
    };
  },
  computed: {
    image() {
      const hoge = this.$store.getters['image/imagedate'];
      return hoge;
    },
  },
  mounted() {
    this.fetchEvent();
  },
  methods: {
    async fetchEvent(get) {
      const events = 'https://todonuxt-api.herokuapp.com/api/v1/events';
      const response = await this.$axios.get(events, get);
      this.events = response.data.events;
    },
    infiniteHandler() {
      setTimeout(() => {
        if (this.count < 100) {
          this.count += 20;
          this.$refs.infiniteLoading.stateChanger.loaded();
        } else {
          this.$refs.infiniteLoading.stateChanger.complete();
        }
      }, 1000);
    },
  },
};
</script>
