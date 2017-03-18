class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    fb = Facebooker.new(oauth: request.env['omniauth.auth'])
    fb.register! unless fb.user_exists?
    sign_in(fb.user)
    redirect_to authenticated_root_path
  end
end
