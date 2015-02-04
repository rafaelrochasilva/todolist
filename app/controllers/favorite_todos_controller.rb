class FavoriteTodosController < ApplicationController

  def index
    @my_favorites = current_user.favorite_todos.includes(:todo_list).all
  end

  def favorite
    @todo_list = TodoList.find(params[:id])

    if params[:type] == "favorite"
      favorite = current_user.favorite_todos.find_or_create_by(todo_list_id: @todo_list.id)
      message = "Todo List #{@todo_list.name} was marked as favorite"
      current_user.feed_entries.create(message: message)
      flash[:notice] = "Add #{@todo_list.name} as favorite"
    else
      favorite = current_user.favorite_todos.find_by(todo_list_id: @todo_list.id)
      if favorite
        favorite.destroy

        message = "Todo List #{@todo_list.name} was unmarked as favorite"
        current_user.feed_entries.create(message: message)

        flash[:notice] = "Remove #{@todo_list.name} as favorite"
      end
    end
    respond_with(nil, @todo_list)
  end

	def create
		todo_list = TodoList.find(params[:id])
		favorite = current_user.favorite_todos.find_or_create_by(todo_list_id: todo_list.id)

		current_user.feed_entries.create(message: "Todo List #{todo_list.name} was marked as favorite")
		flash[:notice] = "Add #{todo_list.name} as favorite"

		respond_with(todo_list)
	end
end