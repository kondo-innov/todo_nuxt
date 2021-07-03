<template>
    <v-container>
      <v-card-text>
        <v-form ref="form" lazy-validation>
          <v-text-field
            v-model="user.name"
            prepend-icon="mdi-account"
            label="新しい名前"
          />
          <v-text-field
            v-model="user.email"
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
  name: 'App',
  data() {
    return {
      user: {
        name: '',
        email: '',
      },
    }
  },
  methods: {
    editEmail() {
      this.$axios
        .put('api/v1/auth', this.user, {
          headers: {
            'access-token': localStorage.getItem('access-token'),
            uid: localStorage.getItem('uid'),
            client: localStorage.getItem('client'),
          },
        })
        .then((response) => {
          localStorage.setItem('access-token', response.headers['access-token'])
          localStorage.setItem('client', response.headers.client)
          localStorage.setItem('uid', response.headers.uid)
          localStorage.setItem('token-type', response.headers['token-type'])
          window.location.href = '/'
        })
    },
  },
}
</script>