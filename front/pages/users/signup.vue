<template>
  <div class="mx-auto mt-5 pa-5">
    <v-card width="600px" class="mx-auto mt-5">
      <v-card-title>
        <h1 class="display-1">
          新規登録
        </h1>
      </v-card-title>
      <v-card-text>
        <v-form ref="form" lazy-validation>
          <v-text-field
            v-model="user.name"
            :rules="[rules.required, rules.name]"
            prepend-icon="mdi-lead-pencil"
            label="ニックネーム"
          />
          <v-text-field
            v-model="user.email"
            :rules="[rules.required, rules.email]"
            prepend-icon="mdi-email"
            label="メールアドレス"
          />
          <v-text-field
            v-model="user.password"
            :rules="[rules.required]"
            prepend-icon="mdi-lock"
            :append-icon="toggle.icon"
            :type="password"
            autocomplete="on"
            @click:append="show = !show"
            label="パスワード"
          />
          <v-text-field
            v-model="user.password_confirmation"
            :rules="[rules.required]"
            prepend-icon="mdi-lock"
            append-icon="mdi-eye-off"
            type="password"
            label="パスワード確認"
          />
          <v-card-actions>
            <v-btn
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
  show: false,
  data() {
    const max = 20
    return {
      user: {
        name: '',
        password: '',
        email: '',
        password_confirmation: '',
      },
      max,
      rules: {
        required: v => !!v || '入力してください',
        name:     v => (!!v && max >= v.length) || `${max}文字以内で入力してください`,
        email:    v => /.+@.+\..+/.test(v) || ''
      },
    }
  },
  methods: {
    registerUser() {
      if (this.$refs.form.validate()){
        this.$axios.post('/api/v1/auth', this.user)
          .then(async(response) => {
            await this.$auth
              .loginWith('local', {
              // emailとpasswordの情報を送信
                data: {
                  email: this.user.email,
                  password: this.user.password,
                },
              })
              .then(
                (response) => {
                  // レスポンスで返ってきた、認証に必要な情報をlocalStorageに保存
                  localStorage.setItem('access-token', response.headers['access-token'])
                  localStorage.setItem('client', response.headers.client)
                  localStorage.setItem('uid', response.headers.uid)
                  localStorage.setItem('token-type', response.headers['token-type'])
                  
                    this.$store.dispatch(
                      "flashMessage/showMessage",
                      {
                        message: "新規登録しました.",
                        type: "sucess",
                        status: true,
                      },
                      { root: true }
                    )
                  return response
                },
                (error) => {
                  return error
                }
              )
              window.location.href = '/'
            })
          .catch((error) => {
            debugger;
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
  computed: {
    toggle () {
      const icon = this.show ? 'mdi-eye' : 'mdi-eye-off'
      const type = this.show ? 'text' : 'password'
      return { icon, type }
    }
  }
}
</script>