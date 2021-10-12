class Content < ApplicationRecord
  belongs_to :user_profile

  has_many_attached :images
end
