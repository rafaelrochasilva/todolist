class FavoriteTodosController < ApplicationController

	def index
		@my_favorites = current_user.favorite_todos.all
	end

end