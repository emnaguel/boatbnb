class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  rating = [0, 1, 2, 3, 4, 5]
end
