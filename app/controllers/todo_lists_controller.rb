class TodoListsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :my_todos, :destroy]

	def index
		@todo_lists = TodoList.all.where(private_todo: false)
	end

	def my_todos
		@my_todos = current_user.todo_lists.all
		p @my_todos.count
	end

	def show
		@todo_list = TodoList.find(params[:id])
	end

	def new
		@todo_list = TodoList.new
	end

	def create
		@todo_list = TodoList.new(todo_params)

		if @todo_list.save
			flash[:notice] = "Todo was successfully created."
			redirect_to @todo_list
		else
			flash[:notice] = "Coudn't create a Todo."
			render 'new'
		end
	end

	def edit
		@todo_list = TodoList.find(params[:id])
	end

	def update
		@todo_list = TodoList.find(params[:id])

		if @todo_list.update(todo_params)
			flash[:notice] = "Todo was successfully updated."
			redirect_to @todo_list
		else
			flash[:notice] = "Couldn't update a Todo."
			render 'edit'
		end
	end

	private
	def todo_params
		params.require(:todo_list).permit(:name, :private_todo, :user_id)
	end
end