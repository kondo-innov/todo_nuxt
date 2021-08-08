<template>
  <v-form>
    <v-row class="pt-4 pl-3">
      <v-icon>mdi-camera</v-icon>
      <span>つぶやき画像</span>
    </v-row>
    <v-row justify="center" class="pt-6">
      <v-avatar tile size="200">
        <img :src="image">
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
      image: [],
    }
  },
  methods: {
    addPicture(e) {
      e.preventDefault();
      const image = e.target.files[0];
      this.upload(image)
    },
    async upload(image) {
      const reader = new FileReader()
      reader.readAsDataURL(image)
      reader.addEventListener('load', () => {
        this.image = reader.result
      })
      this.image = image
      this.$emit('setPicture', this.image)
    },
  }
}
</script>