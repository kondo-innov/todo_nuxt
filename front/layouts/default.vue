<template>
  <v-app style="background-color: #eceff1">
    <Header />
    <v-main>
      <v-container>
        <FlashMessage />
        <nuxt />
      </v-container>
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
import FlashMessage from '../components/layouts/FlashMessage.vue';
import Footer from '../components/layouts/Footer.vue';
import Header from '../components/layouts/Header.vue';
export default {
  auth: false,
  components: {
    Header,
    Footer,
    FlashMessage,
  },
};
</script>

<style></style>
