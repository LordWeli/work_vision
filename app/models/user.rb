class User < ApplicationRecord
  has_one :user_profile
  has_one :address

  validates :email, presence: true,
    format: { with: /\A[a-z0-9.]+@[a-z0-9]+\.[a-z]+(\.[a-z]+)?\Z/i, message: 'Invalid e-mail!' },
    uniqueness: true

  validates :password, presence: true

  before_create :encrypt_password

  after_create :add_user_profile

  def encrypt_password
    self.password = BCrypt::Password.create(self.password)
  end

  def add_user_profile
    UserProfile.create(user_id: self.id)
  end
end
