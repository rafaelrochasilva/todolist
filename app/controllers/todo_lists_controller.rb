class TodoListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @todo_lists = TodoList.public_visibility
  end

  def my_todos
    @my_todos = current_user.todo_lists.all
  end

  def show
    if user_signed_in?
      @todo_list = current_user.todo_lists.find(params[:id])
    else
      @todo_list = TodoList.public_visibility.find(params[:id])
    end
    @favorite = @todo_list.favorite_todos.find_by(user_id: current_user)
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = current_user.todo_lists.create(todo_params)
    respond_with(@todo_list)
  end

  def edit
    @todo_list = current_user.todo_lists.find(params[:id])
  end

  def update
    @todo_list = current_user.todo_lists.find(params[:id])
    @todo_list.update(todo_params)
    respond_with(@todo_list)
  end

  def destroy
    @todo_list = current_user.todo_lists.find(params[:id])
    @todo_list.destroy
    respond_with(@todo_list)
  end

  private
  def todo_params
    params.require(:todo_list).permit(:name, :private_todo, :user_id, :photo)
  end
end