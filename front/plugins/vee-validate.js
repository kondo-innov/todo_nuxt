import Vue from "vue"
import {
  ValidationProvider,
  ValidationObserver,
  extend,
  localize,
} from "vee-validate"
import ja from "vee-validate/dist/locale/ja.json"
import * as rules from "vee-validate/dist/rules" // 全てのバリデーションルール

// 全てのルールをインポート
for (let rule in rules) {
  extend(rule, rules[rule])
}

// メッセージを設定
localize("ja", ja)

Vue.component("ValidationProvider", ValidationProvider)
Vue.component("ValidationObserver", ValidationObserver)
