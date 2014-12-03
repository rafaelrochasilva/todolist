require 'rails_helper'

describe TodoList do

	it "is valid with name, user and private tag" do
		todo_list = FactoryGirl.create(:todo_list)
		expect(todo_list).to be_valid
	end

	it "is invalid without a user" do
		todo_list = FactoryGirl.build(:todo_list, user: nil)
		todo_list.valid?
		expect(todo_list.errors[:user]).to include("can't be blank")
	end

	it "is invalid without name" do
		todo_list = FactoryGirl.build(:todo_list, name: nil)
		todo_list.valid?
		expect(todo_list.errors[:name]).to include("can't be blank")
	end
end