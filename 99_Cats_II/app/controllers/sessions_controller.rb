class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login_user!(user)
    else
      redirect_to cats_url
    end
  end

  def destroy
    if @current_user
      @current_user.reset_session_token!
      session[:session_token] = nil
    end
  end

end
