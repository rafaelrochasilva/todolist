require 'rails_helper'

feature 'Favorite Todos management' do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }
  let(:todo_list) { user.todo_lists.create(name: 'A fancy way to make a turtle', private_todo: true) }

  scenario 'User favorites one todo' do
    visit todo_list_path(todo_list)
    click_link 'favorite'

    expect(page).to have_content 'unfavorite'
  end

  scenario 'User unfavorites one todo' do
    visit todo_list_path(todo_list)
    click_link 'favorite'
    click_link 'unfavorite'

    expect(page).not_to have_content 'unfavorite'
  end

  scenario 'User tries to favorite an unvisible todo' do
    logout(user)
    
    visit todo_list_path(todo_list)
    click_link 'favorite'

    expect { raise "Couldn't find TodoList" }.to raise_exception
  end
end
