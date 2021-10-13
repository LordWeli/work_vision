class User < ApplicationRecord
  has_one :user_profile

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  before_create :encrypt_password

  def encrypt_password
    self.password = BCrypt::Password.create(self.password)
  end
end
