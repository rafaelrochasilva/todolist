require 'rails_helper'

describe TodoList do

	it "is valid with name, user and private tag" do
		todo_list = FactoryGirl.create(:todo_list)
		expect(todo_list).to be_valid
	end
end