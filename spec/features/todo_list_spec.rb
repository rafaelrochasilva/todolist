require 'rails_helper'

feature 'TodoList management' do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	let(:todo_list) { user.todo_lists.create(name: "test") }


	scenario 'adds a new todo list' do
	  visit root_path
	  click_link 'New'

	  fill_in 'Name', with: todo_list.name

	  click_button "Add"

	  expect(page).to have_content 'Todo was successfully created.'
	end

	scenario 'displays all public todo lists' do
	  visit root_path
	  click_link 'All'

	  expect(page).to have_content "All Public Todos"
	end

	scenario 'display all private todo lists' do
		visit root_path
		click_link "My Todos"
		expect(page).to have_content "My Private Todos"
	end

	scenario 'display one todo list' do
		visit todo_list_path(todo_list.id)
		expect(page).to have_css ".card"
	end

	scenario 'update one todo list' do
		visit todo_list_path(todo_list.id)
		click_link "Update"
		expect(page).to have_content "Edit Todo"
	end

	scenario 'delete one todo list' do
		visit todo_list_path(todo_list.id)
		click_link "X"
		expect(page).to have_content "Todo Successfully destroyed."
	end

end