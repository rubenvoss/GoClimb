Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :profiles, except: %i[index destroy] do
    member do
      resources :reviews, except: %i[show destroy]
    end
  end
end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
