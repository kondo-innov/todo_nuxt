<template>
  <div class="mx-auto mt-5 pa-5">
    <v-card width="600px" class="mx-auto mt-5">
      <v-card-title>
        <h1 class="display-1">新規登録</h1>
      </v-card-title>
      <v-card-text>
        <v-form ref="form" v-model="isValid" lazy-validation>
          <v-text-field
            v-model="user.name"
            :placeholder="nameForm.placeholder"
            :rules="[rules.required, rules.name]"
            prepend-icon="mdi-lead-pencil"
            label="ニックネーム"
          />
          <v-text-field
            v-model="user.email"
            :rules="[rules.required, rules.email]"
            :placeholder="emailForm.placeholder"
            prepend-icon="mdi-email"
            label="メールアドレス"
          />
          <v-text-field
            v-model="user.password"
            :rules="[rules.required, rules.password]"
            :counter="!noValidation"
            :placeholder="form.placeholder"
            prepend-icon="mdi-lock"
            label="パスワード"
            :append-icon="toggle.icon"
            :type="toggle.type"
            autocomplete="on"
            @click:append="show = !show"
          />
          <v-text-field
            v-model="user.password_confirmation"
            :rules="[rules.required, rules.password]"
            :counter="!noValidation"
            :placeholder="form.placeholder"
            prepend-icon="mdi-lock"
            label="パスワード確認"
            :append-icon="toggle.icon"
            :type="toggle.type"
            autocomplete="on"
            @click:append="show = !show"
          />
          <v-card-actions>
            <v-btn
              :disabled="!isValid"
              color="light-green darken-1"
              class="white--text"
              @click="registerUser"
            >
              新規登録
            </v-btn>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </div>
</template>

<script>
export default {
  auth: false,
  data() {
    const max = 20
    const min = 6
    return {
      isValid: false,
      noValidation: false,
      show: false,
      user: {
        name: "",
        password: "",
        email: "",
        password_confirmation: "",
      },
      max,
      rules: {
        required: (v) => !!v || "入力してください",
        name: (v) =>
          (!!v && max >= v.length) || `${max}文字以内で入力してください`,
        email: (v) => /.+@.+\..+/.test(v) || "",
        password: (v) =>
          (!!v && min <= v.length) || `${min}文字以上で入力してください`,
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
    form() {
      const min = "6文字以上"
      const placeholder = this.noValidation ? undefined : min
      return { placeholder }
    },
    toggle() {
      const icon = this.show ? "mdi-eye" : "mdi-eye-off"
      const type = this.show ? "text" : "password"
      return { icon, type }
    },
  },
  methods: {
    registerUser() {
      if (this.$refs.form.validate()) {
        this.$axios
          .post("/api/v1/auth", this.user)
          .then(async (response) => {
            await this.$auth
              .loginWith("local", {
                // emailとpasswordの情報を送信
                data: {
                  email: this.user.email,
                  password: this.user.password,
                },
              })
              .then(
                (response) => {
                  // レスポンスで返ってきた、認証に必要な情報をlocalStorageに保存
                  localStorage.setItem(
                    "access-token",
                    response.headers["access-token"]
                  )
                  localStorage.setItem("client", response.headers.client)
                  localStorage.setItem("uid", response.headers.uid)
                  localStorage.setItem(
                    "token-type",
                    response.headers["token-type"]
                  )
                  this.$store.dispatch(
                    "flashMessage/showMessage",
                    {
                      message: "新規登録しました.",
                      type: "sucess",
                      status: true,
                    },
                    { root: true }
                  )
                  window.location.href = "/"
                  return response
                },
                (error) => {
                  return error
                }
              )
          })
          .catch((error) => {
            this.$store.dispatch(
              "flashMessage/showMessage",
              {
                message: "新規登録出来ませんでした.",
                type: "sucess",
                status: true,
              },
              { root: true }
            )
          })
      }
    },
  },
}
</script>
