class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # user can be null if email is not found, so check for it.
    # Also check for password.
    if user && user.authenticate(params[:session][:password])
      # Save the user id in the session
      session[:user_id] = user.id
      
      # Notify success
      flash[:success] = "You have successfully logged in!"
      
      # redirects to the user's show page.
      redirect_to user_path(user)
      
    else
      # Using flash.now (instead of flash) will persist the message (??)
      flash.now[:danger] = "There was somethign wrong with login credentials."
      render 'new'
    end
  end
  
  def destroy
    # thi sia logout action
    session[:user_id] = nil
    flash[:success] = "You have logged out."
    redirect_to root_path
  end
  
end