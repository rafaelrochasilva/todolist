class FavoriteTodosController < ApplicationController

	def index
		@my_favorites = current_user.favorite_todos.all
	end

	def favorite
		@todo_list = TodoList.find(params[:id])

		if params[:type] == "favorite"
			current_user.favorite_todos.create(todo_list_id: @todo_list.id)
			flash[:notice] = "Add #{@todo_list.name} as favorite"
			respond_with(@todo_list)
		else
			current_user.favorite_todos.delete(todo_list_id: @todo_list.id)
			flash[:notice] = "Remove #{@todo_list.name} as favorite"
			respond_with(nil, @todo_list)
		end
	end

end