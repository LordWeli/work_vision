class UserProfile < ApplicationRecord
  belongs_to :user

  has_one :service
  has_one :hour
  has_one :verification
  has_one :contact

  has_many :contents

  has_one_attached :avatar
end
