class Movie < ApplicationRecord
  belongs_to :director
  has_many_attached :images
end
