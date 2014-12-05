class TodoList < ActiveRecord::Base
	belongs_to :user
	has_many :list_items
	has_many :favorite_todos
	has_many :favorited_by, through: :favorite_todos, source: :user

	validates_presence_of :name, :user
end