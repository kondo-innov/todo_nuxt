<template>
  <div class="mt-3">
    <v-form ref="form">
      <v-container>
        <v-row justify="center">
          <v-col
            cols="12"
            md="10"
            sm="10"
          >
            <v-btn
              block
              class="mr-4 blue white--text"
              @click="deleteUser"
            >
              削除
            </v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: '',
    };
  },

  mounted() {
    this.fetchUser();
  },

  methods: {
    async fetchUser(get) {
      const user = 'http://localhost:3000/api/v1/users';
      const response = await this.$axios.get(user, get);
      this.user = response.data;
    },
    deleteUser() {
      this.$axios
        .delete('api/v1/auth', { params: {email: this.user.email},
          headers: {
            'access-token': localStorage.getItem('access-token'),
            uid: localStorage.getItem('uid'),
            client: localStorage.getItem('client'),
          },
        })
        .then((response) => {
          this.$auth.logout();
          setTimeout(() => {
            this.$store.dispatch(
              'flashMessage/showMessage',
              {
                message: '削除に成功しました.',
                type: 'sucess',
                status: true,
              },
              { root: true }
            );
          }, 1000);
        })
        .catch((err) => {
          console.log(err);
          setTimeout(() => {
            this.$store.dispatch(
              'flashMessage/showMessage',
              {
                message: 'ゲストユーザーは削除できません',
                type: 'sucess',
                status: true,
              },
              { root: true }
            );
          }, 1000);
        });
    },
  },
};
</script>
