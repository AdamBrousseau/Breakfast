FactoryGirl.define do

  sequence :name do |n|
	"Person #{n}"
  end

  sequence :email do |n|
    "person_#{n}@webphr.com"
  end

  sequence :first_name do |n|
    "FirstName #{n}"
  end

  sequence :last_name do |n|
    "LastName #{n}"
  end

  factory :user do
    #name
    #email
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@webphr.com"}
    #name     "Michael Hartl"
    #email    "michael@example.com"
    password "foobar"
    password_confirmation { |u| u.password }

    factory :admin do
      admin true
    end
  end

  factory :user1 do
    #name
    #email
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "p_#{n}@webphr.com"}
    #name     "Michael Hartl"
    #email    "michael@example.com"
    password "foobar"
    password_confirmation { |u| u.password }
  end

  factory :phr do
  	#first_name
  	#last_name
  	sequence(:first_name)  { |n| "FirstName #{n}" }
  	sequence(:last_name)  { |n| "LastName #{n}" }
  	date_of_birth DateTime.civil(1980, 1, 2)
  	gender "Male"
  	blood_type "A+"
  	sequence(:health_card_no) { |n| "#{n}" }
  	user
  end

  factory :contact do
    sequence(:name) { |n| "Person #{n}" }
    phone1 "1234567890"
    phone2 "9876543210"
    email "myemail@test.com"
    description "My Friend"
    user
  end
end