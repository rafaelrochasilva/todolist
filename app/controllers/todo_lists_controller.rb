class TodoListsController < ApplicationController
	def new
		@todo_list = TodoList.new
	end

	def create
		@todo_list = TodoList.new(todo_params)

		if @todo_list.valid?
			flash[:notice] = "Todo was successfully created."
			redirect_to @todo_list
		else
			flash[:notice] = "Coudn't create a Todo."
			render 'new'
		end
	end

	private
	def todo_params
		params.require(:todo_list).permit(:name, :private_todo, :user_id)
	end
end