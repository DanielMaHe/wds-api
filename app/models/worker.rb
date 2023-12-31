# frozen_string_literal: true

class Worker < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :mail, presence: true, uniqueness: true
  # validates :password_digest, presence: true

  def invalid_token
    update(token: nil)
  end

  def admin?
    isAdmin
  end
end
