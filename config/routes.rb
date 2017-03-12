Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'omniauth_callbacks' },
    only: [:sessions, :omniauth_callbacks]
  root to: redirect('/users/sign_in')
end
