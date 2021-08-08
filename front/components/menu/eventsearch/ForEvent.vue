<template>
  <v-row class="mt-8">
    <v-col cols="10">
      <v-card color="gray" class="px-6" width="600px" @click.stop="dialog = true">
          <h2 class="pb-4">
            {{ event.eventname }}
            <h6 class="float-right d-inline">ユーザー名：{{ event.name }}</h6>
          </h2>
          <h4 class="d-inline">
            開催日時:{{ $moment(event.datetime).format('YYYY年MM月DD日 HH時mm分') }}
          </h4>
          <h4 class="d-inline float-right">
            開催市区:{{ event.cityward }}
          </h4>
        <v-dialog hide-overlay persistent v-model="dialog" max-width="600px" activator :retain-focus="false">
          <ShowEvent 
            @closeDialog= "dialog=false"
            :event ="event"
          />
        </v-dialog>
      </v-card>
    </v-col>
    <v-col cols="2">
      <v-avatar size="80">
        <v-img v-if="event.image == null" :src="defaultImg" />
        <v-img v-else :src="event.image" />
      </v-avatar>
    </v-col>
  </v-row>
</template>

<script>
import ShowEvent    from "~/components/menu/eventsearch/ShowEvent.vue"

export default {
  components: {
    ShowEvent,
  },
  data() {
    return {
      dialog:    false,
    }
  },
 props: ["event"],
}
</script>