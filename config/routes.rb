Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :profiles, except: %i[index destroy] do
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: [:destroy]
end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
