class SessionsController < ApplicationController
  def new
    @login_error = nil
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to sign_in_path, :alert => "#{current_user.username} logged out."
  end

  def create
    @login_error = nil
    user = User.find_by_username(params[:username])

    if user && user.enabled && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      end
      session[:user_id] = user.id
      if session[:return_to]
        path = session[:return_to]
        session[:return_to] = nil
        redirect_to path
      else
        redirect_to root_path
      end
    else
      if user && !user.enabled
        @login_error = "This user has been disabled"
      else
        @login_error = "Invalid username or password"
      end
      render "new"
    end
  end
end

