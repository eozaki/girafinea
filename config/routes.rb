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

  scope :events, as: :event do
    get 'index' => 'events#index'
    get 'new' => 'events#new'
    get 'show/:id' => 'events#show', as: :show
  end
end
