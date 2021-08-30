<template>
  <v-container>
    <ValidationProvider
      v-slot="{ errors }"
      :rules="rules"
      name="つぶやき"
    >
      <v-textarea
        v-model="tweetValue"
        label="つぶやき"
        :counter="100"
        clearable
        clear-icon="mdi-close-circle"
      />
      <span id="error">{{ errors[0] }}</span>
    </ValidationProvider>
  </v-container>
</template>

<script>
export default {
  props: {
    rules: {
      type: [Object, String],
      default: '',
    },
    value: {
      type: null,
    },
  },
  computed: {
    tweetValue: {
      get() {
        return this.value;
      },
      set(newVal) {
        if (this.value !== newVal) this.$emit('input', newVal);
      },
    },
  },
};
</script>
