<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <h2 class="pb-4">
          ユーザー名:{{ url.name }}
        </h2>
        <h2 class="pb-4">
          メールアドレス:{{ url.email }}
        </h2>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      users: '',
      url: '',
    };
  },
  mounted() {
    this.User();
  },

  methods: {
    async User(get) {
      const url = 'http://todonuxt-api.herokuapp.com/api/v1/users';
      const response = await this.$axios.get(url, get);
      this.url = response.data;
    },
  },
};
</script>
