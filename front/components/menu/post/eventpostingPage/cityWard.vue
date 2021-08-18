<template>
  <ValidationProvider
    v-slot="{ errors }"
    :rules="rules"
    name="市区郡"
  >
    <v-select
      class="mx-2"
      :items="name"
      label="市区郡"
      outlined
      dense
      clearable
      v-model="selectValue"
    ></v-select>
    <span id="error">{{ errors[0] }}</span>
  </ValidationProvider>
</template>

<script>
  export default {
    data () {
      return {
        name: [
          '名古屋市', '豊橋市', '岡崎市','一宮市', '瀬戸市', '半田市',
          '春日井市', '豊川市', '津島市','碧南市', '刈谷市', '豊田市',
          '安城市', '西尾氏', '蒲郡市','犬山市', '常滑市', '江南市',
          '小牧市', '稲沢市', '新城氏','東海市', '大府市', '知多市',
          '知立市', '尾張旭市', '高浜市','岩倉市', '豊明市', '日進市',
          '田原市', '愛西市', '清須市','北名古屋市', '弥富市', 'みよし市',
          'あま市', '長久手市', '愛知郡','海部郡', '知多郡', '北設楽郡',
          '西春日井郡', '丹羽郡', '額田郡',
        ],
      }
    },
    props: {
      rules: {
        type: [Object, String],
        default: ''
      },
      value: {
        type: String
      }
    },

    computed: {
      selectValue: {
        get () {
          return this.value
        },
        set (newVal) {
          if (this.value !== newVal) this.$emit('input', newVal)
        }
      }
    }
  }
</script>