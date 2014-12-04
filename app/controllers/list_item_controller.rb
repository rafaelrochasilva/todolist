class ListItemController < ApplicationController
	respond_to :json

	def create
		todo_list = TodoList.find(params[:todo_list_id])
		@list_item = todo_list.list_items.create(list_item_params)

		respond_with(@list_item, :location => nil)
	end

	def destroy
		@list_item = ListItem.find(params[:id])
		@list_item.destroy

		respond_with(@list_item, :location => nil)
	end

	private
	def list_item_params
		params.require(:todo_list_item).permit(:description)
	end
end