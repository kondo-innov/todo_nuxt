<template>
  <v-container>
    <post-menu />
  </v-container>
  <!-- <v-container>
     <v-row justify="center" :style="feed">
      <v-col xl="2" lg="3" sm="8" cols="12">
        <menu
          @openMicropostFeed="openMicropostFeed"
          @openBoardFeed="openBoardFeed"
          @openGadgetFeed="openGadgetFeed"
        />
      </v-col>
      <v-col xl="5" lg="7" sm="8" cols="12">
        <MicropostFeed
          :render="micropostFeed"
        />
        <BoardFeed
          :render="boardFeed"
        />
        <GadgetFeed
          :render="gadgetFeed"
        />
      </v-col>
    </v-row>
  </v-container> -->
</template>
<script>
import postMenu from "~/components/postMenu.vue"
export default {

  components: {
    postMenu,
  },
  data () {
    return {
    }
  },
}
</script>