require 'rails_helper'

describe ListItem do

	it 'is valid with description and todo list id' do
		list_item = FactoryGirl.create(:list_item)
		expect(list_item).to be_valid
	end

	it 'is invalid without description' do
		list_item = FactoryGirl.build(:list_item, description: nil)
		list_item.valid?
		expect(list_item.errors[:description]).to include "can't be blank"
	end

	it 'is invalid without todo_list' do
		list_item = FactoryGirl.build(:list_item, todo_list_id: nil)
		list_item.valid?
		expect(list_item.errors[:todo_list_id]).to include "can't be blank"
	end
end