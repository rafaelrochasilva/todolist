class CreateListItem < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
    	t.belongs_to :todo_list, null: false
    	t.string :description, null: false
    	t.timestamp
    end
  end
end
