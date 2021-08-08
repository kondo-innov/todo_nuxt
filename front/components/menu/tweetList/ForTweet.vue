<template>
  <v-row class="mt-8">
    <v-col cols="12">
      <v-card color="gray" height="300px" position: relative>
        <span>
          <v-avatar size="80">
            <v-img v-if="tweet.image == null" :src="defaultImg" />
            <v-img v-else :src="tweet.image" />
          </v-avatar>
          <h2 class="name">
            {{ tweet.name }}<br>
            投稿日時:{{ $moment(tweet.created_at).format('YYYY年MM月DD日 HH時mm分') }}
          </h2>
        </span>
        <v-row>
          <v-col cols="12">
            <h4 class="mt-6 ml-2">
              {{ tweet.description }}
            </h4>
          </v-col>
        </v-row>
        <v-row justify="center">
          <v-avatar tile size="150">
            <v-img :src="tweet.picture" />
          </v-avatar>
        </v-row>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data() {
    return {
      defaultImg: require("@/assets/images/default_user_icon.jpeg"),
    }
  },
  props: ["tweet"],
}
</script>

<style>
.name {
  display: inline-block;
  text-align: center;
  position: absolute;
  top:10px;
  left: 120px;
}
</style>