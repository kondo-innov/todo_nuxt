<template>
  <v-container>
    <v-text-field
      v-model="addressValue"
      label="◯◯町◯◯番地"
      outlined
      dense
      clearable
    ></v-text-field>
  </v-container>
</template>

<script>
export default {
  props: ["value"],

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