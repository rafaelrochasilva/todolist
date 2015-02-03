class TodoListsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :find_todo_list, except: [:create, :update, :destroy]

	def index
		@todo_lists = TodoList.where(private_todo: false)
	end

	def my_todos
		@my_todos = current_user.todo_lists.all
	end

	def show
		@todo_list = TodoList.find(params[:id])
		@favorite = @todo_list.favorite_todos.find_by(user_id: current_user)
	end

	def new
		@todo_list = TodoList.new
	end

	def create
		if @todo_list.save
			respond_with(@todo_list)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @todo_list.update(todo_params)
			respond_with(@todo_list)
		else
			render 'edit'
		end
	end

	def destroy
		@todo_list.destroy

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