class BookList < ApplicationRecord
  belongs_to :book
  belongs_to :ownerable, polymorphic: true
end
