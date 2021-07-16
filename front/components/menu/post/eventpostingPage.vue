<template>
  <v-app>
    <v-form v-model="valid">
      <v-container>
        <v-row>
          <v-col
            cols="8"
          >
          <eventName />
          </v-col>
        </v-row>
        <v-row>
          <v-col
            cols="8"
          >
          <dateTime />
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </v-app>
</template>

<script>
import eventName from "~/components/menu/post/eventpostingPage/eventName.vue"
import dateTime  from "~/components/menu/post/eventpostingPage/dateTime.vue"
export default {
  components: {
    eventName,
    dateTime,
  },
  data () {
    return {
      valid:           false,
    }
  },
}
</script>