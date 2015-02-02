FactoryGirl.define do
	factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(10) }
  	factory :auth_user do
  		email 'test@test.com'
  		password '123456789'
  	end
  end

  factory :todo_list do
  	name Faker::Lorem.word
  	private_todo false
  	user
  end

  factory :list_item do
    description Faker::Lorem.paragraph
    todo_list
  end

  factory :feed_entry do
    message Faker::Lorem.sentence
    user
  end
end
