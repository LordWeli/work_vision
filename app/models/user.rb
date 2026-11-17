class User < ApplicationRecord
  has_secure_password

  validates :password_confirmation, presence: true, on: :create

  has_one :profile
  has_one :address

  normalizes :email, with: ->(email) { email.strip.downcase }

  validates :email, presence: true,
    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Invalid e-mail!' },
    uniqueness: true

  attr_accessor :oauth_name

  after_create :add_profile

  def self.from_omniauth(auth)
    user = find_by(provider: auth.provider, uid: auth.uid)

    return user if user

    return nil unless auth.extra.raw_info.email_verified

    user = find_by(email: auth.info.email)

    if user
      user.update(provider: auth.provider, uid: auth.uid)
      return user
    end

    random_password = SecureRandom.hex(20)

    create(
      email: auth.info.email,
      provider: auth.provider,
      uid: auth.uid,
      password: random_password,
      password_confirmation: random_password,
      oauth_name: auth.info.name
    )
  end

  def add_profile
    Profile.create!(user: self, fullname: oauth_name)
  end
end
