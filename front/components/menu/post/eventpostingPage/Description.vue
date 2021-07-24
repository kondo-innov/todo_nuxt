<template>
  <v-container >
    <v-textarea
      v-model="descriptionValue"
      label="イベントの説明"
      counter="1000"
      clearable
      clear-icon="mdi-close-circle"
    ></v-textarea>
  </v-container>
</template>

<script>
export default {
  props: ["value"],

  computed: {
    descriptionValue: {
      get () {
        return this.value
      },
      set (newVal) {
        if (this.value !== newVal) this.$emit('input', newVal)
      }
    }
  }
}
</script>