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
end