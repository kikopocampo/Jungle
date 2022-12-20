class SessionsController < ApplicationController
 
  def new
  end

  def create
    
    user = User.find_by_email(params[:email].downcase.strip)
    if User.authenticate_with_credentials(params[:email], params[:password])
    
      session[:user_id] = user.id.to_s
      redirect_to root_path
    else
      flash[:notice] = "Invalid Email/Password, please try again"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Logged out!"
  end

end
