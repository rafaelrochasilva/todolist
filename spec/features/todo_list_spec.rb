require 'rails_helper'

feature 'TodoList management' do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

	let(:todo_list) { user.todo_lists.create!(name: 'Painting the wall like a boss', private_todo: false) }

	scenario 'User visit all public todo lists' do
		user.todo_lists.create!(name: 'Private idea of painting', private_todo: true)
		user.todo_lists.create!(name: 'Public idea of painting', private_todo: false)
		
		visit root_path
		click_link 'All'

		expect(page).to have_content 'Public idea of painting'
		expect(page).not_to have_content 'Private idea of painting'
	end

	scenario 'User can see only private todos made by him self' do
		private_painting = user.todo_lists.create!(name: 'Mike private painting on the wall', private_todo: true)
		logout(user, scope: :user)

		visit todo_list_path(private_painting)

		expect { raise 'Not Allowed' }.to raise_exception
	end

	scenario 'User creates a new todo list' do
		visit root_path
		click_link 'New'
		fill_in 'Name', with: 'Black blocks'
		click_button 'Add'

		expect(page).to have_content 'Black blocks'
	end

	scenario 'User updates one todo list' do
		visit todo_list_path(todo_list.id)
		click_link 'Update'
		fill_in 'Name', with: 'Green Pepper'
		click_button 'Update'

		expect(page).to have_content 'Green Pepper'
	end

	scenario 'User deletes one todo list' do
		visit todo_list_path(todo_list.id)
		click_link 'X'

		expect(page).not_to have_content 'Painting the wall like a boss'
	end
end