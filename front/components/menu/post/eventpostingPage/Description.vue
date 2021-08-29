<template>
  <v-container>
    <ValidationProvider
      v-slot="{ errors }"
      :rules="rules"
      name="イベントの説明"
    >
      <v-textarea
        v-model="descriptionValue"
        label="イベントの説明"
        :counter="1000"
        clearable
        clear-icon="mdi-close-circle"
      ></v-textarea>
      <span id="error">{{ errors[0] }}</span>
    </ValidationProvider>
  </v-container>
</template>

<script>
export default {
  props: {
    rules: {
      type: [Object, String],
      default: "",
    },
    value: {
      type: null,
    },
  },

  computed: {
    descriptionValue: {
      get() {
        return this.value
      },
      set(newVal) {
        if (this.value !== newVal) this.$emit("input", newVal)
      },
    },
  },
}
</script>
