Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          registrations: 'api/v1/auth/registrations',
          sessions: 'api/v1/auth/sessions'
      }
      resources :users,          only: %i[index create show]
      resource  :current_user,   only: %i[index show]
      resources :tweets, format: "json"
      resources :events, format: "json"
      resources :likes,          only: %i[index create destroy]
      resources :tweet_comments, format: "json"
      resources :event_comments, format: "json"
      resources :joins,          only: %i[index create destroy]
    end
  end
end