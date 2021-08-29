module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
  },
  parserOptions: {
    parser: "babel-eslint",
  },
  extends: [
    "eslint:recommended",
    "plugin:vue/recommended",
    "plugin:prettier/recommended",
  ],
  plugins: ["vue"],
  rules: {
    "vue/max-attributes-per-line": "off",
    "no-unused-vars": "off", //使っていない変数を許可
    "vue/html-self-closing": "off", //空タグを許可する
    "prettier/prettier": ["error", { semi: false }],
    "vue/html-closing-bracket-newline": [2, { multiline: "never" }], // タグの最後で改行しないで
    "no-extra-parens": 1, // 不要なカッコは消す
    "no-multi-spaces": 2, // 無駄なスペースは削除
    "no-multiple-empty-lines": [2, { max: 1 }], // 不要な空白行は削除。2行開けてたらエラー
    "func-call-spacing": [2, "never"], // 関数とカッコはあけない(function hoge() {/** */})
    "no-unneeded-ternary": 2, // true/falseを無駄に使うな
    semi: [2, "never"], // セミコロンは禁止
    quotes: [2, "single"], // 文字列はシングルクオートのみ
    indent: [2, 2], // jsのインデントは２
    "space-in-parens": [2, "never"], // かっこの中はスペースなし！違和感
    "no-console": 0, // コンソールは許可
    "comma-spacing": 2, // カンマの前後にスペース入れる？
    "computed-property-spacing": 2, // 配列のindexには空白入れるな(hogehoge[ x ])
    "key-spacing": 2, // キー
    "keyword-spacing": 2, // キーワードの前後には適切なスペースを
  },
}
