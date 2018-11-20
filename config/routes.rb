Rails.application.routes.draw do
  devise_for :users
  # # resources :users
  # # resources :devise
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "home#index"

  # resources :book_lists
  resources :books
  # resources :clubs
  # resources :comments
  # resources :genres
  # resources :likes
  # resources :options
  # resources :polls
  # resources :posts
  # resources :reviews
  # resources :user_clubs
  resources :users

  resources :clubs do
    scope module: :clubs do
      resources :posts do
        scope module: :posts do
          resources :comments
        end
      end
    end
  end

  root to: redirect('/clubs')
  # root to: "users#index"
end
