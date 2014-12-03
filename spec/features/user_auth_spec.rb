require 'rails_helper'

describe "User Authorization " do
	let(:user) { FactoryGirl.build(:user) }

	describe 'User registration' do

		it "is valid with email, password and password confirmation" do
			visit root_path
			click_link "Sign up"
			fill_in 'Email', with: user.email
			fill_in 'user_password', with: user.password
			fill_in 'user_password_confirmation', with: user.password

			click_button 'Sign up'

			expect(page).to have_text 'Welcome! You have signed up successfully.'
		end

		it "is invalid without password confirmation" do
			visit root_path
			click_link "Sign up"

			fill_in 'Email', with: user.email
			fill_in 'user_password', with: user.password

			click_button 'Sign up'

			expect(page).to have_text "doesn't match Password"
		end

	end

	describe 'User sign in' do
		it "allows a registered user" do
			auth_user = FactoryGirl.create(:auth_user)
			visit root_path
			click_link "Log in"

			fill_in "Email", with: auth_user.email
			fill_in "Password", with: auth_user.password
			click_button "Log in"
			expect(page).to have_text "Signed in successfully"
		end

		it "doesn't allow unregistered user" do
			visit root_path
			click_link "Log in"

			fill_in "Email", with: user.email
			fill_in "Password", with: user.password
			click_button "Log in"
			expect(page).to have_text "Invalid email or password"
		end
	end

	describe "User log out" do
		it "log out a user" do
			auth_user = FactoryGirl.create(:auth_user)

			visit root_path
			click_link "Log in"

			fill_in "Email", with: auth_user.email
			fill_in "Password", with: auth_user.password
			click_button "Log in"

			click_link "Log out"
			expect(page).to have_text "Signed out successfully"
		end
	end

end