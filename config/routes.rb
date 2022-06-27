Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do 
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
      resources :notes
      # get "get_mayank/:id", to: "notes#mayank_get"
      # patch "update_mayank/:id", to: "notes#mayank_update"
    end
  end
  resources :appointments
end
