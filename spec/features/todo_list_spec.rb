require 'rails_helper'

feature 'TodoList management' do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	let(:todo_list) { FactoryGirl.build(:todo_list) }


	scenario 'adds a new todo list' do
	  visit root_path
	  click_link 'New Todo'

	  fill_in 'Name', with: todo_list.name

	  click_button "Add"

	  expect(page).to have_content 'Todo was successfully created.'
	end



end