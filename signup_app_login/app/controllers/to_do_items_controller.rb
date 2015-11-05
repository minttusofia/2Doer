class ToDoItemsController < ApplicationController
  def create
    @to_do_item = current_user.to_do_items.build(to_do_item_params)
    if @to_do_item.save
      flash[:success] = "New item added"
      redirect_to :back
    else 
      flash[:error] = "Could not save item!"
      render 'users/show' 
#      users/show?
    end
  end
  
  def destroy
    
  end 
  
  private
  def to_do_item_params
    params.require(:to_do_item).permit(:content)
  end
  
end
