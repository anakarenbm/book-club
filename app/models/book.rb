class Book < ApplicationRecord
  belongs_to :genre
  mount_uploader :picture, PictureUploader
end
