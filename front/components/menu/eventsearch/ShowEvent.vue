<template>
  <v-card>
    <v-card-title>
      <span class="text-h4">{{ event.eventname }}</span>
    </v-card-title>
    <v-divider></v-divider>
    <v-card-text>
      <v-container>
        <v-row class="mx-auto">
          <v-card-text class="text-h5" >開催日時:{{ $moment(event.datetime).format('YYYY年MM月DD日 HH時mm分') }}</v-card-text>
          <v-card-text class="text-h5">開催市区:{{ event.cityward }}</v-card-text>
          <v-card-text class="text-h5">開催地{{ event.streetaddress }}</v-card-text>
          <v-card-text class="text-h5">イベント内容{{ event.description }}</v-card-text>
        </v-row>
      </v-container>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn
        color="blue darken-1"
        text
        @click="$emit('closeDialog')"
      >
        閉じる
      </v-btn>
      <v-btn
        color="blue darken-1"
        text
      >
        参加
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      dialog:    false,
      events:    {},
    }
  },
  props: ["event"],
}
</script>