Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/search", to: "pages#search"

  resources :profiles, except: %i[index destroy] do
    resources :reviews, only: %i[new create]
  end

  resources :reviews, only: [:destroy]
  resources :crags
end
