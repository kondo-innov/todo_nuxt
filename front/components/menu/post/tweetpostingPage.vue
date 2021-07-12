<template>
  <v-dialog
    v-model="dialog"
    persistent
    max-width="600px"
  >
    <template v-slot:activator="{ on, attrs }">
      <v-btn
        class="mt-2"
        block
        elevation="2"
        large
        rounded
        x-large
        color="primary"
        dark
        v-bind="attrs"
        v-on="on"
      >
        つぶやきはこちらから
      </v-btn>
    </template>
    <v-card>
      <v-card-title class="cyan darken-1" flat>
        <span class="text-h4 white--text">投稿する</span>
      </v-card-title>
      <v-card-text>
        <v-container>
          <v-row>
            <v-col cols="12">

            </v-col>
            <v-col cols="12">
              <v-textarea
                v-model="description"
                label="説明文"
              >

              </v-textarea>
            </v-col>
          </v-row>
        </v-container>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn
          color="blue darken-1"
          text
          @click="dialog = false"
        >
          Close
        </v-btn>
        <v-btn
          color="blue darken-1"
          text
          @click="dialog = false"
        >
          Save
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
  export default {
    data: () => ({
      dialog: false,
    }),
  }
</script>