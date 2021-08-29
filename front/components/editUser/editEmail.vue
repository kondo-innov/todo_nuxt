<template>
  <v-container>
    <v-card-text>
      <v-form ref="form" v-model="isValid" lazy-validation>
        <v-text-field
          v-model="user.name"
          :placeholder="nameForm.placeholder"
          :rules="[rules.name]"
          prepend-icon="mdi-account"
          label="新しい名前"
        />
        <v-text-field
          v-model="user.email"
          :rules="[rules.email]"
          :placeholder="emailForm.placeholder"
          prepend-icon="mdi-email"
          label="新しいメールアドレス"
        />
        <v-card-actions>
          <v-btn
            color="light-green darken-1"
            class="white--text"
            @click="editEmail"
          >
            変更する
          </v-btn>
        </v-card-actions>
      </v-form>
    </v-card-text>
  </v-container>
</template>

<script>
export default {
  data() {
    const max = 20
    return {
      isValid: false,
      noValidation: false,
      user: {
        name: "",
        email: "",
      },
      rules: {
        name: (v) =>
          (!!v && max >= v.length) || `${max}文字以内で入力してください`,
        email: (v) => /.+@.+\..+/.test(v),
      },
    }
  },
  computed: {
    nameForm() {
      const placeholder = this.noValidation ? undefined : "username"
      return { placeholder }
    },
    emailForm() {
      const placeholder = this.noValidation ? undefined : "your@email.com"
      return { placeholder }
    },
  },
  methods: {
    editEmail() {
      this.$axios
        .put("api/v1/auth", this.user, {
          headers: {
            "access-token": localStorage.getItem("access-token"),
            uid: localStorage.getItem("uid"),
            client: localStorage.getItem("client"),
          },
        })
        .then((response) => {
          localStorage.setItem("access-token", response.headers["access-token"])
          localStorage.setItem("client", response.headers.client)
          localStorage.setItem("uid", response.headers.uid)
          localStorage.setItem("token-type", response.headers["token-type"])
          setTimeout(() => {
            this.$store.dispatch(
              "flashMessage/showMessage",
              {
                message: "更新に成功しました.",
                type: "sucess",
                status: true,
              },
              { root: true }
            )
            window.location.href = "/users/edit"
          }, 500)
        })
        .catch((err) => {
          setTimeout(() => {
            this.$store.dispatch(
              "flashMessage/showMessage",
              {
                message: "更新に失敗しました.",
                type: "sucess",
                status: true,
              },
              { root: true }
            )
          }, 500)
        })
    },
  },
}
</script>
