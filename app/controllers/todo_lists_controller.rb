class TodoListsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :edit, :update, :my_todos, :destroy]
	before_action :find_todo_list, except: [:index, :new, :create, :my_todos]

	def index
		@todo_lists = TodoList.where(private_todo: false)
	end

	def my_todos
		@my_todos = current_user.todo_lists
	end

	def show
		@favorite = @todo_list.favorite_todos.find_by(user_id: current_user)
	end

	def new
		@todo_list = TodoList.new
	end

	def create
		@todo_list = TodoList.new(todo_params)

		if @todo_list.save
			flash[:notice] = "Todo was successfully created."
			respond_with(@todo_list)
		else
			flash[:notice] = "Coudn't create a Todo."
			render 'new'
		end
	end

	def edit
	end

	def update
		if @todo_list.update(todo_params)
			flash[:notice] = "Todo was successfully updated."
			respond_with(@todo_list)
		else
			flash[:notice] = "Couldn't update a Todo."
			render 'edit'
		end
	end

	def destroy
		@todo_list.destroy
		flash[:notice] = "Todo Successfully destroyed."

		respond_with(@todo_list)
	end

	private
	def todo_params
		params.require(:todo_list).permit(:name, :private_todo, :user_id, :photo)
	end

	def find_todo_list
		@todo_list = current_user.todo_lists.find(params[:id])
	end
end