class Devise::RegistrationsController < DeviseController
  def new
    params.require(:sign_up).permit(:username, :email, :password, :password_confirmation, :user_id)
    super
  end

  def update
    params.require(:account_update).permit(:username, :email, :password, :password_confirmation, :user_id)
    super
  end
  
end