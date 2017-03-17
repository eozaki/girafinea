Rails.application.routes.draw do
  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users,
             controllers: { omniauth_callbacks: 'user/omniauth_callbacks' },
             only: [:sessions, :omniauth_callbacks]

  scope :invitations do
    get 'index' => 'invitations#index'
  end
end
