class RegistrationsController < Devise::RegistrationsController
  def create
    params.require(:sign_up).permit(:username, :email, :password, :password_confirmation, :user_id)
    @user.username = params[:user][:username]
    super
  end

  def update
    params.require(:account_update).permit(:username, :email, :password, :password_confirmation, :user_id)
    @user.username = params[:user][:username]
    super
  end
  
end