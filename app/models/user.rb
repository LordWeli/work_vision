class User < ApplicationRecord
  has_one :user_profile

  validates :email, presence: true, uniqueness: true
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
