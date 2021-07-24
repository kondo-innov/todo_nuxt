<template>
  <div class="container">
    <v-input>
      <VueCtkDateTimePicker 
        v-model="timeValue" 
        label="イベント日時"
      >
      </VueCtkDateTimePicker>
    </v-input>
  </div>
</template>
 
<script> 
export default {
  props: ["value"],

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
