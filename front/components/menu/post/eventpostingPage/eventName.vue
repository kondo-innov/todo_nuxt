<template>
  <v-container>
    <ValidationProvider
      v-slot="{ errors }"
      :rules="rules"
      name="イベント名"
    >
      <v-text-field
        v-model="internalValue"
        :counter="20"
        label="イベント名"
        outlined
        dense
        clearable
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
    internalValue: {
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
