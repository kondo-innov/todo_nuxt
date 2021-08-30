<template>
  <v-dialog
    v-model="dialog"
    transition="dialog-bottom-transition"
    max-width="600px"
  >
    <template #activator="{ on, attrs }">
      <v-btn
        icon
        text
        color="grey darken-2"
        v-bind="attrs"
        v-on="on"
      >
        <v-icon> mdi-comment-outline </v-icon>
      </v-btn>
    </template>
    <v-card
      min-height="300px"
      position
      relative
    >
      <v-btn
        color="blue darken-1"
        text
        @click="dialog = false"
      >
        <v-icon> mdi-close </v-icon>
      </v-btn>
      <v-row justify="center">
        <span class="text-h5">コメント</span>
      </v-row>
      <v-row>
        <v-list-item
          v-for="comment in tweet.comment"
          :key="comment.id"
        >
          <v-col cols="10">
            {{ comment.content }}
          </v-col>
          <v-col cols="2">
            <v-btn
              v-if="comment.user_id === $auth.user.id"
              icon
              text
              color="grey darken-2"
              @click="sendDelete(comment.id)"
            >
              <v-icon> mdi-delete </v-icon>
            </v-btn>
          </v-col>
        </v-list-item>
      </v-row>
      <form>
        <ValidationObserver v-slot="ObserverProps">
          <v-row>
            <v-col
              cols="9"
              class="ml-8"
            >
              <ValidationProvider
                v-slot="{ errors }"
                rules="max:100|required"
                name="コメント"
              >
                <v-text-field
                  v-model="content"
                  :counter="100"
                  label="コメント"
                  dense
                />
                <span id="error">{{ errors[0] }}</span>
              </ValidationProvider>
            </v-col>
            <v-col cols="2">
              <v-btn
                :disabled="ObserverProps.invalid"
                color="blue darken-1"
                text
                outlined
                @click="sendcontent"
              >
                Save
              </v-btn>
            </v-col>
          </v-row>
        </ValidationObserver>
      </form>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: ['tweet'],
  data() {
    return {
      dialog: false,
      content: '',
      defaultImg: require('@/assets/images/default_user_icon.jpeg'),
    };
  },

  methods: {
    sendDelete(id) {
      this.$axios
        .delete(`/api/v1/tweet_comments/${id}`)
        .then(() => {
          this.$emit('setcomment', this.tweet);
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
          setTimeout(() => {
            this.$store.dispatch(
              'flashMessage/showMessage',
              {
                message: '削除に失敗しました.',
                type: 'sucess',
                status: true,
              },
              { root: true }
            );
          }, 1000);
        });
    },
    sendcontent() {
      const formData = new FormData();
      formData.append('content', this.content);
      formData.append('tweet_id', this.tweet.id);
      const config = {
        headers: {
          'content-type': 'multipart/form-data',
        },
      };
      this.$axios
        .post('/api/v1/tweet_comments', formData, config)
        .then(() => {
          console.log('投稿に成功しました')
          ;this.content = '', this.$emit('setcomment', this.tweet);
          setTimeout(() => {
            this.$store.dispatch(
              'flashMessage/showMessage',
              {
                message: '投稿に成功しました.',
                type: 'sucess',
                status: true,
              },
              { root: true }
            );
          }, 1000);
        })
        .catch((err) => {
          setTimeout(() => {
            this.$store.dispatch(
              'flashMessage/showMessage',
              {
                message: '投稿に失敗しました.',
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
