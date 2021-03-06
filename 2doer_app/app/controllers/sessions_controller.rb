class SessionsController < ApplicationController
  def new
  end
    
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user #CHANGE TO LIST
    else 
        flash.now[:notice] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
  end
  
end
