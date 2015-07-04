class TodoItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  def index
    if params[:todo_list_id]
      @todo_list = TodoList.find_by(id: params[:todo_list_id])
      @todo_items = @todo_list.todo_items.page(params[:page]).per(params[:per])
    else
      @todo_items = current_user.todo_items.page(params[:page]).per(params[:per])
    end
  end

  def show
  end

  def new
    @todo_item = TodoList.find_by(id: params[:todo_list_id]).todo_items.new
  end

  def edit
  end

  def create
    @todo_item = TodoItem.new(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        format.html { render :show }
        format.js { render :create }
      else
        format.html { render :new }
      end
    end
  end
  # format.html { redirect_to "/todo_lists/#{@todo_item.todo_list_id}" }

  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to @todo_items }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

  private
    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

    def todo_item_params
      params.require(:todo_item).permit(:todo_list_id, :task_name, :description, :due_date, :complete)
    end
end
