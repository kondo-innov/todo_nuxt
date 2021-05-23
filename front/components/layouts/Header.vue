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
    <v-btn
      to="/users/login"
      text
      color="white"
      :outlined="true"
      small
    >
    <span>ログイン</span>
    </v-btn>
  </v-app-bar>
</template>

<script>
  export default {
    data: () => ({
      drawer: false,
      group: null,
    }),
  }
</script> 