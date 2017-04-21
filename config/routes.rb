Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'

  root 'welcome#index'

  resources :sessions, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
     namespace :v1 do
       resources :users do
         resources :lists
       end
       resources :lists, only: [] do
         resources :items, except: [:destroy]
       end
       resources :items, only: [:destroy]
     end
   end
end
