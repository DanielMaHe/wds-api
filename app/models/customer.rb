class Customer < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :comment, presence: true
end
