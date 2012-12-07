class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_for_login
  before_filter :check_force_login

  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    if request.xhr?
      render :json => exception.message, :status => 403
    else
      flash[:alert] = "You do not have permission to access that page."
      redirect_to root_path
    end
  end

private

  def current_user
    user = nil
    if session[:user_id]
      user = User.find(session[:user_id])
    elsif cookies[:auth_token]
      user = User.find_by_auth_token!(cookies[:auth_token])
    end
    @current_user ||= user
  rescue => e
    session[:user_id] = nil
    nil
  end

  def check_force_login
    if request.params["login"] and request.params["login"] == "true" and current_user.nil?
      session[:return_to] = request.fullpath.gsub("login=true", "")
      redirect_to '/sign-in'
    end
  end

  def check_for_login
    return if current_user
    p = request.path
    unless p =~ /sign-in/  or p =~ /sign-up/  or p =~ /sessions/ or p =~ /users/ or p =~/ulrs/ or p=~/indications_of_interest/ or p=~/book/
      redirect_to '/sign-in'
    end
  end

  helper_method :current_user
end
