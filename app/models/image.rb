# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :proyect
  mount_uploader :file, ImageUploader
end
