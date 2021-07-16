<template>
  <v-form v-model="valid">
    <v-container>
      <v-row>
        <v-col
          cols="8"
        >
        <eventName />
        </v-col>
        <v-col>

        </v-col>
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
import eventName from "~/components/menu/post/eventpostingPage/eventName.vue"

export default {
  components: {
    eventName,
  },
  data () {
    return {
      valid:           false,
    }
  },
}
</script>