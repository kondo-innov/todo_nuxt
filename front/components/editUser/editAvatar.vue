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
      <v-file-input
        v-model="inputValue"
        accept="image/png, image/jpeg, image/bmp"
        prepend-icon="mdi-image"
        label="画像を選択してください"
        class="pt-14"
        @change="setImage"
      />
        <v-btn block color="success" class="white--text" @click="changeUserAvatar">
          変更
        </v-btn>
      </v-col>
    </v-row>
  </v-form>
</template>

<script>
  export default {
    props: {
      value: {
        type: null
      },
    },
    data(){
      return {
        input_image: null,
        defaultImg: require("@/assets/images/default_user_icon.jpeg")
      }
    },
    computed: {
      inputValue: {
        get() {
          return this.value
        },
        set(value) {
          this.$emit("input", value)
        }
      }
    },
    methods: {
      setImage(file) {
        if (file !== undefined && file !== null) {
          if (file.name.lastIndexOf(".") <= 0) {
            return
          }
          const fr = new FileReader()
          fr.readAsDataURL(file)
          fr.addEventListener("load", () => {
            this.input_image = fr.result
          })
        } else {
          this.input_image = null
        }
      },
      async changeUserAvatar() {
        const formData = new FormData()
        console.log(formData.get('image')); 
        if (this.input_image != "") {
          formData.append("image", this.input_image)
        }
        await this.$axios
          .put("api/v1/auth", formData, {
            headers: {
              "Content-Type": "multipart/form-data",
            },
          })
      // 成功時の処理
      .then((res) => {
        console.log(res)
        this.$store.commit("auth/setCurrentUser", res.data.data)
        this.$store.dispatch(
          "flashMessage/showMessage",
          {
            message: "アバター画像を更新しました。",
            type: "success",
            status: true,
          },
          { root: true }
        )
      })
      // 失敗時の処理
      .catch((error) => {
        console.log(error)
      })
    }
  }
 }
</script>