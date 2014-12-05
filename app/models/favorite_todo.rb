class FavoriteTodo < ActiveRecord::Base
	belongs_to :user
	belongs_to :todo_list

	validates_uniqueness_of :user_id, :todo_list_id
end