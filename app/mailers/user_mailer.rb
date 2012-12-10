class UserMailer < ActionMailer::Base
  default :from => "notification@connamara.com"

  def password_reset(user)
    @user = user
    @url = edit_password_reset_url(@user.password_reset_token)
    mail(:to => user.email, :subject => "Reset your GenericRails account password")
    Rails.logger.info("Sent password reset email to '#{@user.email}'")
  end
end
