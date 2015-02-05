class TodoList < ActiveRecord::Base
	belongs_to :user
	has_many :list_items
	has_many :favorite_todos

	has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => ":style/missing.png"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	validates_presence_of :name, :user

	scope :public_visibility, -> { where(private_todo: false) }
  scope :visible_for, ->(user) { where('todo_lists.user_id = ? OR todo_lists.private_todo = ?', user.id, false) }
end
