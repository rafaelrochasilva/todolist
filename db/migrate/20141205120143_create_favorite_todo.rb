class CreateFavoriteTodo < ActiveRecord::Migration
  def change
    create_table :favorite_todos do |t|
    	t.belongs_to :user
    	t.belongs_to :todo
    end
  end
end
