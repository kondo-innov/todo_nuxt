<template>
  <div class="mt-3">
    <v-form ref="form">
      <v-container>
        <v-row justify="center">
          <v-col cols="12" md="10" sm="10">
            <v-btn block class="mr-4 blue white--text" @click="deleteUser">
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
  name: "App",
  data: () => ({}),
  methods: {
    deleteUser() {
      this.$axios
        .delete("api/v1/auth", {
          headers: {
            "access-token": localStorage.getItem("access-token"),
            uid: localStorage.getItem("uid"),
            client: localStorage.getItem("client"),
          },
        })
        .then((response) => {
          this.$auth.logout()
          this.$store.dispatch(
            "flashMessage/showMessage",
            {
              message: "削除しました.",
              type: "sucess",
              status: true,
            },
            { root: true }
          )
          window.location.href = "/"
          return response
        })
    },
  },
}
</script>
