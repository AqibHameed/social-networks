Rails.application.routes.draw do

  devise_scope :user do

    authenticated :user do

      root 'posts#index', as: :authenticated_root

    end

    unauthenticated do

      root 'users/sessions#new', as: :unauthenticated_root

    end

  end

  devise_for :users, controllers: {

      registrations: 'users/registrations',
      sessions: 'users/sessions',
      passwords: 'users/passwords'

  }

  resources :friend_requests
  resources :friend_ships
  resources :posts do
    resources :comments
    resources  :likes
  end

end
