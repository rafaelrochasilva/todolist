require 'rails_helper'

feature 'ListItem management' do
	let(:auth_user) { FactoryGirl.create(:auth_user) }
	before { login_as(auth_user, scope: :user) }

	let(:todo_list) { auth_user.todo_lists.create(name: "Test", private_todo: false)}


	scenario "adds a new list item to Todo List" do
		list_item = todo_list.list_items.new(description: "Test")

		visit todo_list_path(todo_list)

		click_button '+ item'
		find(:css, "input[@id='description']").set "description_id"

		fill_in 'description_id', with: list_item.description

		expect(page).to have_content "List Item was successfully created."
	end
end