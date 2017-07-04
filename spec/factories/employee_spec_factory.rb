FactoryGirl.define do
	factory :employees do
		name { Faker::Name.name}
		mobile { Faker::Number.number(10)}
		email { Faker::Internet.email}
		address { Faker::Lorem.word}
		department_id 1
	end
end