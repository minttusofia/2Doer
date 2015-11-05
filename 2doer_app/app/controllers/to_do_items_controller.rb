class ToDoItemsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @to_do_item = current_user.to_do_items.build(to_do_item_params)
    if @to_do_item.save
      flash[:success] = "New item added"
      redirect_to request.referrer
    else 
      flash[:error] = "Could not save item!"
      redirect_to request.referrer
    end
  end
  
  def destroy
    @to_do_item = ToDoItem.find(params[:id])
      if @to_do_item.present?
        @to_do_item.destroy
        flash[:success] = "Item deleted"
      else
        flash[:error] = "Unable to delete"
        redirect_to request.referrer 
      end
    redirect_to request.referrer 
  end 
  
  private
  def to_do_item_params
    params.require(:to_do_item).permit(:content)
  end
  
end
