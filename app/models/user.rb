class User < ApplicationRecord
  has_one :user_profile

  validates :email, presence: true, uniqueness: true
end
