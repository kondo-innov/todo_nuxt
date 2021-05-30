# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors


Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:8080'
    resource '*',
      headers: :any,
      expose: ['access-token', 'uid', 'client', 'token-type'],
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

# * はワイルドカードといい不特定の文字を表します。つまり、何が入っても〜という意味になります。

# origins (文字列 or 正規表現): どのオリジンを許可するか（APIをうつ側のドメイン）
# resource (文字列 or 正規表現): 許可したいリソースファイル
# methods (文字列 or Array or :any): 許可したいHTTPメソッド
# headers (文字列 or Array or :any): 許可したいHTTPヘッダー