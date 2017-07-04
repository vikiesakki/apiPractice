FactoryGirl.define do
	factory :department do
		name {Faker::Name.name}
		created_by {Faker::Lorem.word}
	end
end