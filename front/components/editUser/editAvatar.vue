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
        <input
          accept="image/png, image/jpeg, image/bmp"
          prepend-icon="mdi-image"
          label="画像を選択してください"
          class="pt-14"
          id="image-files"
          ref="image_files"
          type="file"
          @change="onChangeFiles"
        />
      </v-col>
    </v-row>
  </v-form>
</template>

<script>
  import DirectUploader from '@/plugins/DirectUploader'
  export default {
    data(){
      return {
        files: [],
        input_image: null,
        defaultImg: require("@/assets/images/default_user_icon.jpeg")
      }
    },
    methods: {
      onChangeFiles (_event) {
        const input = this.$refs.image_files
        this.uploadFiles(input.files)
        // 選択されたファイルを入力からクリアしておく
        input.value = null
      },
      uploadFiles (files) {
        this.files = []
        Array.from(files).forEach(file => this.uploadFile(file))
      },
      uploadFile (file) {
        // アップロードを実行
        const filename = file.name
        const tmpUploadFile = { name: filename, fileSize: file.size, progress: 0, isUploading: true }
        this.files.push(tmpUploadFile)
        const url = 'http://localhost:3000/rails/active_storage/direct_uploads'
        const directUploader = new DirectUploader(file, url, this._onUploadProgress.bind(this))
        directUploader.upload(this._onUploadError.bind(this), this._onUploadSuccess.bind(this))
      },
      _onUploadError (error, directUploader) {
        // アップロード失敗時の処理
        const params = { isUploading: false, message: error }
        const filename = directUploader.file.name
        this._updateFiles(filename, params)
      },
      async _onUploadSuccess (blob, directUploader) {
        // アップロード成功時の処理
        const filename = directUploader.file.name
        const params = { isUploading: false, message: 'アップロード完了' }
        const postParams = { filename: blob.filename, image: blob.signed_id }
        const url = 'http://localhost:3000/api/v1/avatars'
        try {
          await this.$axios.$post(url, postParams)
          this._updateFiles(filename, params)
        } catch (error) {
          const params = { isUploading: false, message: error }
          this._updateFiles(filename, params)
        }
      },
      _onUploadProgress (event, directUploader) {
        // アップロード中の処理
        const progress = this._calcProgress(event)
        const params = { progress }
        const filename = directUploader.file.name
        this._updateFiles(filename, params)
      },
      _updateFiles (filename, params) {
        this.files = this.files.map((file) => {
          if (file.name !== filename) { return file }
          return Object.assign(file, params)
        })
      },
      _calcProgress (event) {
        return (event.loaded / event.total) * 100
      }
    }
  }
</script>