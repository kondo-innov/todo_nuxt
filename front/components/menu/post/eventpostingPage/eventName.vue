<template>
  <v-container>
    <v-text-field
      v-model="eventname"
      :rules="nameRules"
      :counter="10"
      label="イベント名"
      prepend-icon="mdi-account"
      required
    ></v-text-field>
  </v-container>
</template>

<script>
export default {
  data () {
    return {
      eventname:       '',
      nameRules: [
        v => !!v || 'イベント名を記入してください',
        v => v.length <= 10 || '10文字以内で入力してください',
      ],
    }
  },
}
</script>