FactoryBot.define do
  factory :user do
    email            { Faker::Internet.email(domain: 'gmail.com') }
    password         { Faker::Internet.password }
    confirm_password { password }

    trait :skip_add_profile_callback do
      after(:build) do |user|
        binding.pry
        User.skip_callback(:create, :after, :add_profile)
      end
    end
  end
end
