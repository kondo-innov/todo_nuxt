<template>
  <div class="container">
    <div>
      <VueCtkDateTimePicker v-model="timeValue"></VueCtkDateTimePicker>    </div>
  </div>
</template>
 
<script> 
export default {
  data() {
    return {
      timeValue: "2021-01-01 00:00"
    }
  }
}
</script>
