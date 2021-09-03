<template>
  <v-app-bar
    color="cyan darken-2"
    dark
    app
    fixed
  >
    <v-toolbar-title>
      <n-link
        to="/"
        style="color: white; text-decoration: none"
      >
        <h2 class="app-title">
          Crearn City！
        </h2>
      </n-link>
    </v-toolbar-title>
    <v-spacer />
    <template v-if="store">
      <router-link to="/users/edit">
        <v-avatar size="40">
          <v-img
            v-if="image == null"
            :src="defaultImg"
          />
          <v-img
            v-else
            :src="image"
          />
        </v-avatar>
      </router-link>
    </template>
    <template v-else>
      <v-btn
        text
        color="white"
        :outlined="true"
        small
        @click="GuestLogin"
      >
        <span>ゲストログイン</span>
      </v-btn>
      <v-btn
        to="/users/login"
        text
        color="white"
        :outlined="true"
        small
      >
        <span>ログイン</span>
      </v-btn>
      <v-btn
        to="/users/signup"
        text
        color="white"
        :outlined="true"
        small
      >
        <span>新規登録</span>
      </v-btn>
    </template>
  </v-app-bar>
</template>

<script>
export default {
  data() {
    return {
      email: 'guestlogin@gmail.com',
      password: 'aaaaaa',
      drawer: false,
      group: null,
      defaultImg: require('@/assets/images/default_user_icon.jpeg'),
    };
  },
  computed: {
    store() {
      return this.$auth.loggedIn;
    },
    image() {
      const hoge = this.$store.getters['image/imagedate'];
      return hoge;
    },
  },
  mounted() {
    this.fetchUser();
    this.$store.dispatch('image/doSearch');
  },
  methods: {
    async fetchUser(get) {
      const url = 'http://localhost:3000/api/v1/current_user';
      const response = await this.$axios.get(url, get);
      this.url = response.data.url;
    },
    async GuestLogin() {
      await this.$auth
        .loginWith('local', {
          data: {
            email: this.email,
            password: this.password,
          },
        })
        .then(
          (response) => {
            // レスポンスで返ってきた、認証に必要な情報をlocalStorageに保存
            localStorage.setItem(
              'access-token',
              response.headers['access-token']
            );
            localStorage.setItem('client', response.headers.client);
            localStorage.setItem('uid', response.headers.uid);
            localStorage.setItem('token-type', response.headers['token-type']);
            this.$store.dispatch(
              'flashMessage/showMessage',
              {
                message: 'ゲストログインしました.',
                type: 'sucess',
                status: true,
              },
              { root: true }
            );
            return response;
          },
          (error) => {
            this.$store.dispatch(
              'flashMessage/showMessage',
              {
                message: 'ゲストログイン出来ませんでした.',
                type: 'sucess',
                status: true,
              },
              { root: true }
            );
            return error;
          }
        );
    },
  },
};
</script>
