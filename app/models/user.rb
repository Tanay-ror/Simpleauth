require 'digest'

class User < ApplicationRecord
  has_many :posts

  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates_confirmation_of :password

  before_save :encrypt_password

  def full_name
    "#{first_name} #{last_name}"
  end

  def authenticate(password)
    self.password == encrypt(password)
  end

  private

  def encrypt_password
    self.password = encrypt(password)
  end

  def encrypt(password)
    Digest::SHA256.hexdigest(password)
  end
end
