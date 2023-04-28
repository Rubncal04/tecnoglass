Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:update, :show, :create]
      post '/auth/login', to: 'authentication#login'
      resources :customers
      resources :orders do
        post :approve, on: :member
        post :reject, on: :member
      end
      resources :glass_items
    end
  end
end
