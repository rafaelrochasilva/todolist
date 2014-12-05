class CreateFavoriteTodo < ActiveRecord::Migration
  def change
    create_table :favorite_todos do |t|
    	t.belongs_to :user
    	t.belongs_to :todo_list
    end
  end
end
