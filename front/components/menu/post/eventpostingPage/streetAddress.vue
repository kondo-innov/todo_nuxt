<template>
  <v-container>
    <ValidationProvider
      v-slot="{ errors }"
      :rules="rules"
      name="開催場所"
    >
      <v-text-field
        v-model="addressValue"
        label="開催場所、◯◯町◯◯番地"
        outlined
        dense
        clearable
      ></v-text-field>
      <span id="error">{{ errors[0] }}</span>
    </ValidationProvider>
  </v-container>
</template>

<script>
export default {
  props: {
    rules: {
      type: [Object, String],
      default: ''
    },
    value: {
      type: String
    }
  },

  computed: {
    addressValue: {
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