<template>
  <div class="mt-3">
    <v-form ref="form">
      <v-container>
        <v-row justify="center">
          <v-col cols="12" md="10" sm="10">
            <v-btn block class="mr-4 blue white--text" @click="logout()">
              ログアウト
            </v-btn>
          </v-col>
        </v-row>
      </v-container>
    </v-form>
  </div>
</template>

<script>
export default {
  methods: {
    logout() {
      this.$auth.logout()
      this.$store
        .dispatch(
          "flashMessage/showMessage",
          {
            message: "ログアウトしました.",
            type: "sucess",
            status: true,
          },
          { root: true }
        )
        .catch((error) => {
          this.$store.dispatch(
            "flashMessage/showMessage",
            {
              message: "ログアウト出来ませんでした.",
              type: "sucess",
              status: true,
            },
            { root: true }
          )
        })
    },
  },
}
</script>

<style lang="scss"></style>
