require 'rails_helper'

feature 'Favorite Todos management' do
  let(:user) { FactoryGirl.create(:user) }
  before { login_as(user, scope: :user) }
  let(:todo_list) { user.todo_lists.create(name: 'A fancy way to make a turtle') }


  scenario 'User favorites one todo' do
    visit todo_list_path(todo_list)
    click_link 'favorite'

    expect(page).to have_content 'unfavorite'
  end
end