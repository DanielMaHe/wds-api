# frozen_string_literal: true

class Proyect < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
