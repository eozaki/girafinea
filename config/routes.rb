Rails.application.routes.draw do
  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticated do
      root 'events#index', as: :authenticated_root
    end
  end

  devise_for :users,
             controllers: { omniauth_callbacks: 'user/omniauth_callbacks' },
             only: [:sessions, :omniauth_callbacks]

  resources :events do
    resources :items, only: [:new, :create]
    resources :guests, only: [:new, :create]
  end
end
