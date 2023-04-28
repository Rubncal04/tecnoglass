Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :customers
      resources :orders do
        post :approve, on: :member
        post :reject, on: :member
      end
    end
  end
end
