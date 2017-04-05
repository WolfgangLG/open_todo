Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  namespace :api do
     namespace :v1 do
       resources :users, only: [:index, :show]
       resources :lists, only: [:index, :show]
       resources :items, only: [:index, :show]
     end
   end
end
