class TodoItemsController < ApplicationController
  before_action :set_todo_list

  def create

    # @todo_item = @todo_list.todo_items.create(todo_item_params)
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    if @todo_item.save
      redirect_to @todo_list
    else
      redirect_to @todo_list
    end
  end

  # redirect_to @todo_list

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:success] = "Todo item was deleted"
    else
      flash[:error] = " To do item not deleted "
    end
    redirect_to @todo_list
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end


end
