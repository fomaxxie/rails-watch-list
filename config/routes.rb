Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:index, :new, :show, :create, :destroy] do
    resources :bookmarks, only: [:index, :new, :show, :create]
  end
end
