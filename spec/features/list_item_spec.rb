require 'rails_helper'

feature 'A list items management' do
	let(:auth_user) { FactoryGirl.create(:auth_user) }
	before { login_as(auth_user, scope: :user) }
	let(:todo_list) { auth_user.todo_lists.create(name: "Step by step to create a Monalisa's Graffiti")}

	scenario "User creates a new list item", :js => true do
    list_item = todo_list.list_items.new(description: "Create the background a little bit fuzzy, it will give an impression of depth.")

		visit todo_list_path(todo_list)
		click_button "+ item"
		fill_in "description", with: list_item.description
		click_button "Add"

		expect(page).to have_content "Create the background a little bit fuzzy, it will give an impression of depth."
	end

	scenario "User deletes a list item", :js => true do
    list_item = todo_list.list_items.create!(description: "Moon light in 4 steps")

		visit todo_list_path(todo_list)
		click_link "delete"

		expect(page).to_not have_content "Moon light in 4 steps"
	end
end