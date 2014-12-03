FactoryGirl.define do
	factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(10) }
  	factory :auth_user do
  		email 'test@test.com'
  		password '123456789'
  	end
  end
end
