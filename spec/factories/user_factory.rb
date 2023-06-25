FactoryBot.define do
  factory :user do
    email            { Faker::Internet.email(name: 'test', domain: 'test.com') }
    password         { Faker::Internet.password }
    confirm_password { password }

    trait :skip_add_profile_callback do
      after(:build) do |user|
        if callback_exists?(:add_profile)
          User.skip_callback(:create, :after, :add_profile)
        end
      end
    end
  end
end

def callback_exists?(callback)
  User._create_callbacks.any? { |callbacks| callbacks.filter == callback }
end
