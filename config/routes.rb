Rails.application.routes.draw do

  # devise_for :users

  devise_for :users, :controllers => { registrations: 'registrations' }

  # # resources :users
  # # resources :devise
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "home#index"

  resources :book_lists
  resources :books do
    scope module: :books do
      resources :book_lists
    end
  end
  # resources :clubs
  # resources :comments
  # resources :genres
  # resources :likes
  # resources :options
  # resources :polls
  # resources :posts
  # resources :reviews
  # resources :user_clubs
  resources :users do
    scope module: :users do
      resources :clubs
    end
  end

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
