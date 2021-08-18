<template>
  <div class="container">
    <ValidationProvider
      v-slot="{ errors }"
      :rules="rules"
      name="イベント日時"
    >
      <v-input>
        <VueCtkDateTimePicker 
          :format="'YYYY-MM-DD HH:mm'"
          v-model="datetime" 
          label="イベント日時"
          :minute-interval="30"
          :noButtonNow="true"
          :min-date="start"
          :max-date="end"
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
    datetime: {
      get () {
        return this.value
      },
      set (newVal) {
        if (this.value !== newVal) this.$emit('input', newVal)
      }
    },
    start() {
      // min-date に明日の9時を指定
      const start = this.$moment().add(1, 'days')
      return start.format('YYYY-MM-DDTHH:mm:ss')
    },
    end() {
      // max-date に min-date から3ヶ月後を指定
      const start = this.$moment(this.start)
      const end = start.add(2, 'months').endOf('day')
      return end.format('YYYY-MM-DDTHH:mm:ss')
    }
  }
}
</script>
