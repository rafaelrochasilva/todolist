require 'rails_helper'

feature 'Feed Page' do
	let(:user) { FactoryGirl.create(:user) }
	before { login_as(user, scope: :user) }

  scenario 'displays all feed entries' do
    visit feed_path(user)
    expect(page).to have_content "All User Feed entries"
  end

  scenario 'Favoriting a todo list add an entry to the feed page' do
    todo_list = user.todo_lists.create!(name: 'Private idea of painting', private_todo: true)
  	visit todo_list_path(todo_list)

  	click_link 'favorite' 

  	visit feed_path(user)

  	expect(page).to have_content 'Todo List Private idea of painting was marked as favorite'
  end
end
