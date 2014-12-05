class User < ActiveRecord::Base
	has_many :todo_lists
	has_many :favorite_todos
	has_many :favorites, through: :favorite_todos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
