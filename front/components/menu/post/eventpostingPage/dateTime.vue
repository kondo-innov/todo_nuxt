<template>
  <div class="container">
    <ValidationProvider
      v-slot="{ errors }"
      :rules="rules"
      name="イベント日時"
    >
      <v-input>
        <VueCtkDateTimePicker 
          v-model="timeValue" 
          label="イベント日時"
        >
        </VueCtkDateTimePicker>
      </v-input>
      <span id="error">{{ errors[0] }}</span>
    </ValidationProvider>
  </div>
</template>
 
<script> 
export default {
  props: {
    rules: {
      type: [Object, String],
      default: ''
    },
    value: {
      type: null
    }
  },

  computed: {
    timeValue: {
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
