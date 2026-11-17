class User < ApplicationRecord
  has_secure_password

  validates :password_confirmation, presence: true, on: :create

  has_one :profile
  has_one :address

  validates :email, presence: true,
    format: { with: /\A[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?\Z/i, message: 'Invalid e-mail!' },
    uniqueness: true

  after_create :add_profile

  def add_profile
    Profile.create(user: self)
  end
end
