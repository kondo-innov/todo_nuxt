<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <v-select
          v-model="keyword"
          :items="search"
          label="市区郡"
          outlined
          dense
          clearable
          @change="filteredSearch"
        />
      </v-col>
    </v-row>
    <v-list-item
      v-for="event in ward"
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
      city: '',
      count: 10,
      keyword: '',
      ward: [],
      events: '',
      defaultImg: require('@/assets/images/default_user_icon.jpeg'),
      search: [
        '名古屋市',
        '豊橋市',
        '岡崎市',
        '一宮市',
        '瀬戸市',
        '半田市',
        '春日井市',
        '豊川市',
        '津島市',
        '碧南市',
        '刈谷市',
        '豊田市',
        '安城市',
        '西尾氏',
        '蒲郡市',
        '犬山市',
        '常滑市',
        '江南市',
        '小牧市',
        '稲沢市',
        '新城氏',
        '東海市',
        '大府市',
        '知多市',
        '知立市',
        '尾張旭市',
        '高浜市',
        '岩倉市',
        '豊明市',
        '日進市',
        '田原市',
        '愛西市',
        '清須市',
        '北名古屋市',
        '弥富市',
        'みよし市',
        'あま市',
        '長久手市',
        '愛知郡',
        '海部郡',
        '知多郡',
        '北設楽郡',
        '西春日井郡',
        '丹羽郡',
        '額田郡',
      ],
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
    async fetchEvent() {
      const events = 'http://todonuxt-api.herokuapp.com/api/v1/events';
      const response = await this.$axios.get(events);
      this.events = response.data.events;
      this.filteredSearch();
    },
    async filteredSearch(e) {
      if (e !== undefined) {
        this.city = e;
      }
      const array = this.events.map((value) => value.cityward);
      var aryCheck = array.filter((value) => {
        return value == this.city;
      });
      const ward = this.events.filter((event) => {
        return event.cityward === aryCheck[0];
      });
      this.ward = ward;
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
