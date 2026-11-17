FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    password         { Faker::Internet.password }
    password_confirmation { password }

    trait :skip_add_profile_callback do
      after(:build) do |user|
        if callback_exists?(:add_profile)
          User.skip_callback(:create, :after, :add_profile)
        end
      end

      # skip_callback is global to the User class; restore it so other specs are not affected
      after(:create) do
        User.set_callback(:create, :after, :add_profile) unless callback_exists?(:add_profile)
      end
    end
  end
end

def callback_exists?(callback)
  User._create_callbacks.any? { |callbacks| callbacks.filter == callback }
end
