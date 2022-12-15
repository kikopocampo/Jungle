class UsersController < ApplicationController

  def new
  end

  def create
    if !User.find_by_email(user_params['email'])
      if user_params['password'] != user_params['password_confirmation']
        flash[:notice] = "Registration Failed: Password not match" 
        redirect_to new_user_path
      else
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          redirect_to root_path
        else
          flash[:notice] = "Registration Failed: Incomplete form" 
          redirect_to new_user_path
        end
      end
    else 
      flash[:notice] = "Registration Failed: Email already exists / Incomplete form"
      redirect_to new_user_path
    end
    
  end  

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
