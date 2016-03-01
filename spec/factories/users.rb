FactoryGirl.define do

  factory :user do
    login "login"
    first_name "first_name"
    last_name "last_name"
    sequence(:email) {|i| "email#{i}@email.com"}
    password "password"
  end
	
end