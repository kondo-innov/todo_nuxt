<template>
  <v-app-bar
    color="cyan darken-2" 
    dark 
    app 
    fixed
  >
    <v-toolbar-title>
      <n-link to="/" style="color:white; text-decoration:none">
        <h2 class="app-title">Crearn City！</h2>
      </n-link>
    </v-toolbar-title> 
    <v-spacer />
    <template v-if="store">
      <router-link to="/users/edit">
        <v-avatar size="40">
          <template v-if="image">
            <v-img v-if=" image== null" :src="defaultImg" />
            <v-img v-else :src="image" /> 
          </template>
        </v-avatar>
      </router-link>
    </template>
    <template v-else>
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
        url: '',
        drawer: false,
        group: null,
        defaultImg: require("@/assets/images/default_user_icon.jpeg")
      }
    },
    computed: {
      store() {
        return this.$auth.loggedIn
      },
      image() {
        const hoge = this.$store.getters['image/imagedate']
        return hoge
      },
    },
    mounted () {
      this.fetchUser()
        this.$store.dispatch(
          "image/doSearch",
          
        )
    },
    methods: {
      async fetchUser(get) {
        const url = 'http://localhost:3000/api/v1/current_user'
        const response = await this.$axios.get(url, get)
        this.url = response.data.url
      },
    }
  }
</script> 