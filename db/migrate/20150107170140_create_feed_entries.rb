class CreateFeedEntries < ActiveRecord::Migration
  def change
    create_table :feed_entries do |t|
    	t.belongs_to :user, null: false
    	t.string :message, null: false
    	t.timestamps
    end
  end
end
