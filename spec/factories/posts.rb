FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
    comments_counter { 1 }
    likes_counter { 1 }
    association :author, factory: :user
  end
end
