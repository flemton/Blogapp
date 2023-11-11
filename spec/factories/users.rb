FactoryBot.define do
  factory :user, class: User do
    name { Faker::Name.name }
    photo { 'https://example.com/default-profile-photo.jpg' }
    bio { Faker::Lorem.sentence }
  end
end
