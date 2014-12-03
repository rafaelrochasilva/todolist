class ListItem < ActiveRecord::Base
	belongs_to :todo_list
	validates_presence_of :description, :todo_list
end