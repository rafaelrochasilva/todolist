class AddColumnTodoList < ActiveRecord::Migration
  def change
  	add_attachment :todo_lists, :photo
  end
end
