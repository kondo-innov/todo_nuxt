<template>
  <v-container>
    <v-row justify="center">
      <v-col xl="4" lg="6" sm="8" cols="12">
        <v-card class="mx-auto">
          <v-tabs
            v-model="tab"
            fixed-tabs
            centered
            background-color="cyan darken-1"
            color="white"
            slider-color="orange"
            icons-and-text
          >
            <v-tab class="ma-0 pa-0">
              プロフィール
              <v-icon>mdi-account</v-icon>
            </v-tab>
            <v-tab class="ma-0 pa-0">
              編集・ログアウト
              <v-icon>mdi-account-cog</v-icon>
            </v-tab>
          </v-tabs>
          <v-tabs-items v-model="tab" touchless>
            <v-tab-item>
              <v-container>
                <edit-avatar />
                <name-email />
              </v-container>
            </v-tab-item>
            <v-tab-item>
              <v-container>
                <edit-email />
                <edit-logout />
                <edit-delete />
              </v-container>
            </v-tab-item>
          </v-tabs-items>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import editAvatar from '~/components/editUser/editAvatar';
import NameEmail from '~/components/editUser/NameEmail';
export default {
  components: {
    editAvatar,
    NameEmail,
  },
  data() {
    return {
      tab: null,
    };
  },
  methods: {},
};
</script>
