class SessionsController < ApplicationController
  def create
    user = User.from_twitch(auth_hash)
    cookies.signed[:user_id] = user.id
    redirect_to twitch_name_path(user.twitch_name.downcase)
  end

  def destroy
    cookies.signed[:user_id] = nil
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end