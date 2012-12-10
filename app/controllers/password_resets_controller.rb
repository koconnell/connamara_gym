class PasswordResetsController < ApplicationController
  skip_before_filter :check_for_login

  # form for user to put in email address
  def new
  end

  # "new" form submits here
  def create
    email = params[:email]
    user = User.find_by_email(email)

    notice = ""

    if user.nil?
      Rails.logger.error "Reset-password attempted with non-user address '#{email}'"
      notice = "No user found for #{email}."
    else
      begin
        Rails.logger.info "Reset-password attempt for user '#{user.username}/#{user.email}'"
        user.send_password_reset
        notice = "Email sent to #{email} with password reset instructions."
      rescue => e
        notice = "Unable to send password reset instructions: #{e.message}"
        Rails.logger.error "PasswordResetsController.create error\n#{e.message}\n#{e.backtrace.join("\n  ")}"
      end
    end

    redirect_to sign_in_path, :notice => notice
  end

  # change-password form
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  # change-password form submits here
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to sign_in_url, :notice => "Your password has been changed."
    else
      render :edit
    end
  end

end

