class ListItemController < ApplicationController
	before_action :authenticate_user!
	before_action :find_todo_list

	respond_to :json

	def create
		@list_item = @todo_list.list_items.create(list_item_params)
		respond_with(@list_item, location: nil)
	end

	def destroy
		@list_item = @todo_list.list_items.find(params[:id])
		@list_item.destroy

		respond_with(nil, location: todo_list_path(id: params[:todo_list_id]))
	end

	private
	def list_item_params
		params.require(:todo_list_item).permit(:description)
	end

	def find_todo_list
		@todo_list = current_user.todo_lists.find(params[:todo_list_id])
	end
end