class CreateTodoList < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false
      t.boolean :private_todo, default: false
      t.timestamp
    end
  end
end
