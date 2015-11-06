class UsersController < ApplicationController
  
  def show 
  	@user = User.find(params[:id])
    @to_do_items = current_user.to_do_items.build
     
  end

  def new
      @user = User.new(params[:user])
  end

  def create
      @user = User.new(user_params)
    if @user.save
      log_in @user
        redirect_to @user
    #else
      #flash[:notice] = "You fucked up"
      #render 'new'
    end
  end
  
  def destroy
    log_out @user
    redirect_to root_url
  end 
    
private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
end
