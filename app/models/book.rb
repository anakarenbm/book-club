class Book < ApplicationRecord
  belongs_to :genre
  mount_uploader :picture, PictureUploader

  def avgRating
    sum = 0
    count = 0
    Review.where(book: self).find_each do |review|
      sum += review.stars
      count += 1
    end
    if count > 0
      return sum/count
    end
    return 0
  end

end
