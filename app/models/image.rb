class Image < ApplicationRecord
  belongs_to :proyect
  mount_uploader :file, ImageUploader
end
