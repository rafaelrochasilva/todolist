require 'rails_helper'

feature 'ListItem management' do
	let(:auth_user) { FactoryGirl.create(:auth_user) }
	before { login_as(auth_user, scope: :user) }

	let(:todo_list) { auth_user.todo_lists.create(name: "Todo Title")}


	scenario "adds a new list item to Todo List", :js => true do

		visit todo_list_path(todo_list)

		list_item = todo_list.list_items.new(description: "text item")


		click_button '+ item'

		fill_in 'description', with: list_item.description

		click_button "Add"

		expect(page).to have_content list_item.description
	end
end