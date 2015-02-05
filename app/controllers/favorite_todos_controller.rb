class FavoriteTodosController < ApplicationController

  def index
    @my_favorites = current_user.favorite_todos.includes(:todo_list).all
  end

  def create
    todo_list = TodoList.visible_for(current_user).find(params[:id])
    favorite = current_user.favorite_todos.create(todo_list: todo_list)


    current_user.feed_entries.create(message: "#{todo_list.name} was marked")

    respond_with(todo_list)
  end

  def destroy
    todo_list = TodoList.visible_for(current_user).find(params[:id])
    
    favorite = current_user.favorite_todos.find_by(todo_list_id: todo_list.id)
    favorite.delete

    current_user.feed_entries.create(message: "#{todo_list.name} was unmarked")

    respond_with(todo_list)
  end
end
