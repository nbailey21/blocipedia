class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def downgrade_account
    @user = User.find(params[:id])
    @user.role = 'standard'
    
    @user.wikis.each do |wiki|
      if wiki.private == true
        wiki.update_attributes private: false
      end
    end
    
    if @user.save
      redirect_to root_path
    else
      redirect_to :back
    end
  end
end
