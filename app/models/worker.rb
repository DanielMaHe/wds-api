class Worker < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :mail, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
