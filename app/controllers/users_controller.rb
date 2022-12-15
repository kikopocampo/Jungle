class UsersController < ApplicationController

  def new
  end

  def create

    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Registration Failed: Incomplete form / password do not match"
      redirect_to new_user_path
    end
  end  

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
