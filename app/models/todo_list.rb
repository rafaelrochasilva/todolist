class TodoList < ActiveRecord::Base
	belongs_to :user
	has_many :list_items
	has_many :favorite_todos

	has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => ":style/missing.png"
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	validates_presence_of :name, :user

	scope :public_visibility, -> { where(private_todo: false) }

	def self.find_visible(id, current_user)
		if current_user
			todo = current_user.todo_lists.find(id)
		else
			todo = find_by(id: id, private_todo: false)
		end

		raise ActiveRecord::RecordNotFound, 'Not Allowed' unless todo
		todo
	end

end