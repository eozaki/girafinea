Rails.application.routes.draw do
  root to: redirect('/users/sign_in')
  devise_for :users,
             controllers: { omniauth_callbacks: 'user/omniauth_callbacks' },
             only: [:sessions, :omniauth_callbacks]
  scope :invitations do
    get 'index' => 'invitations#index'
  end
end
