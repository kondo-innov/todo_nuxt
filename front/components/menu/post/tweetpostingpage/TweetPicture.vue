<template>
  <v-form>
    <v-row class="pt-4 pl-3">
      <v-icon>mdi-camera</v-icon>
      <span>つぶやき画像</span>
    </v-row>
    <v-row justify="center" class="pt-6">
      <v-avatar tile size="200">
        <img :src="picture">
      </v-avatar>
      <v-col cols="12">
        <input
          accept="image/png, image/jpeg, image/bmp"
          prepend-icon="mdi-image"
          label="画像を選択してください"
          class="pt-14"
          id="image-files"
          type="file"
          @change="addPicture"
        />
      </v-col>
    </v-row>
  </v-form>
</template>

<script>
export default {
  data() {
    return {
      picture: [],
    }
  },

  methods: {
    addPicture(e) {
      e.preventDefault();
      const picture = e.target.files[0];
      this.upload(picture)
    },
    async upload(picture) {
      const reader = new FileReader()
      reader.readAsDataURL(picture)
      reader.addEventListener('load', () => {
        this.picture = reader.result
      })
      this.picture = picture
      this.$emit('setPicture', this.picture)
    },
  }
}
</script>