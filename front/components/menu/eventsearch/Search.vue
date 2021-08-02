<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <v-select
          :items="search"
          label="市区郡"
          outlined
          dense
          clearable
          v-model="keyword"
          @change="filteredSearch"
        ></v-select>
      </v-col>
    </v-row>
    <v-list-item
      v-for="event in ward"
      :key="event.id"
    >
    <v-row class="mt-8">
        <v-col cols="10">
          <v-card color="gray" class="px-6">
            <h2 class="pb-4">
              {{ event.eventname }}
              <h6 class="float-right d-inline">ユーザー名：{{ event.user.name }}</h6>
            </h2>
            <h4 class="d-inline">
              開催日時:{{ $moment(event.datetime).format('YYYY年MM月DD日 HH時mm分') }}
            </h4>
            <h4 class="d-inline float-right">
              開催市区:{{ event.cityward }}
            </h4>
          </v-card>
        </v-col>
        <v-col cols="2">
          <v-avatar size="80">
            <v-img v-if="image == null" :src="defaultImg" />
            <v-img v-else :src="image" />
          </v-avatar>
        </v-col>
      </v-row>
    </v-list-item>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      count:       10,
      keyword:  '',
      ward:     '',
      events: '',
      defaultImg: require("@/assets/images/default_user_icon.jpeg"),
      search: [
        '名古屋市', '豊橋市', '岡崎市','一宮市', '瀬戸市', '半田市',
        '春日井市', '豊川市', '津島市','碧南市', '刈谷市', '豊田市',
        '安城市', '西尾氏', '蒲郡市','犬山市', '常滑市', '江南市',
        '小牧市', '稲沢市', '新城氏','東海市', '大府市', '知多市',
        '知立市', '尾張旭市', '高浜市','岩倉市', '豊明市', '日進市',
        '田原市', '愛西市', '清須市','北名古屋市', '弥富市', 'みよし市',
        'あま市', '長久手市', '愛知郡','海部郡', '知多郡', '北設楽郡',
        '西春日井郡', '丹羽郡', '額田郡',
      ],
    }
  },
  mounted () {
    this.filteredSearch()
  },

  computed: {
    image() {
      const hoge = this.$store.getters['image/imagedate']
      return hoge
    },
  },
  
  methods: {
    async filteredSearch(e) {
      const events = 'http://localhost:3000/api/v1/events'
      const response = await this.$axios.get(events)
      this.events = response.data
      const array = this.events.map(value => value.cityward)
      var aryCheck = array.filter(value => {
        return value == e
        })
      const ward = this.events.filter(event => {
        return event.cityward === aryCheck[0]
      })
      this.ward = ward
    },

    infiniteHandler() {
      setTimeout(() => {
        if (this.count < 100) {
          this.count += 20
          this.$refs.infiniteLoading.stateChanger.loaded()
        } else {
          this.$refs.infiniteLoading.stateChanger.complete()
        }
      }, 500)
    }
  },
}
</script>