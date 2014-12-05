class FavoriteTodosController < ApplicationController

	def index
		@my_favorites = current_user.favorite_todos.includes(:todo_list).all
	end

	def favorite
		@todo_list = TodoList.find(params[:id])

		if params[:type] == "favorite"
			favorite = current_user.favorite_todos.find_or_create_by(todo_list_id: @todo_list.id)
			flash[:notice] = "Add #{@todo_list.name} as favorite"
		else
			favorite = current_user.favorite_todos.find_by(todo_list_id: @todo_list.id)
			if favorite
				favorite.destroy
				flash[:notice] = "Remove #{@todo_list.name} as favorite"
			end
		end
		respond_with(nil, @todo_list)
	end

end