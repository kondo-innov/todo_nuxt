<template>
  <v-form ref="form" lazy-validation class="mb-6">
    <v-row class="pt-4 pl-3">
      <v-icon>mdi-account-box</v-icon>
      <span>ユーザー画像</span>
    </v-row>
    <v-row justify="center" class="pt-6">
      <v-avatar size="100">
        <template v-if="defaultImg !== null">
          <v-img v-if="input_image !== null" :src="input_image" />
          <v-img v-else :src="defaultImg" />
        </template>
        <template v-else>
          <v-img v-if="input_image" :src="input_image" />
        </template>
      </v-avatar>
      <v-col cols="12">
        <input
          accept="image/png, image/jpeg, image/bmp"
          prepend-icon="mdi-image"
          label="画像を選択してください"
          class="pt-14"
          id="image-files"
          ref="image_files"
          type="file"
          @change="setImage"
        />
      </v-col>
    </v-row>
  </v-form>
</template>

<script>
  export default {
    data(){
      return {
        imageFile: [],
        input_image: null,
        defaultImg: require("@/assets/images/default_user_icon.jpeg")
      }
    },
    methods: {
      setImage(e) {
        e.preventDefault();
        this.imageFile = e.target.files[0];
        this.upload()
      },
      async upload() {
        let formData = new FormData();
        if (this.imageFile !== null) {
          formData.append("image", this.imageFile);
        }
        this.createPost(formData);
      },
      async createPost(post) {
        const url = 'http://localhost:3000/api/v1/avatars'
        const response = await this.$axios.post(url, post)
        console.log(response)
      },
    }
  }
</script>