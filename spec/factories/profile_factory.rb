FactoryBot.define do
  factory :profile do
    fullname    { Faker::Name.name_with_middle }
    slug_name   { Faker::Superhero.name }
    age         { rand(18..105) }
    description { Faker::Quote.famous_last_words }
    document    { Faker::IDNumber.brazilian_citizen_number }
    user { association :user }

    trait :skip_add_profile_callback_of_user do
      association :user, factory: [:user, :skip_add_profile_callback]
    end
  end
end
