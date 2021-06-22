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
          <img v-bind:src="require('@/assets/images/default_user_icon.jpeg')">
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
    data: () => ({
      drawer: false,
      group: null,
    }),
    computed: {
      store() {
      console.log(this.$auth.loggedIn)
      return this.$auth.loggedIn
      },
    }
  }
</script> 