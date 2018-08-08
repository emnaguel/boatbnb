class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  has_one :owner, through: :boat
  validates :user, presence: :true
  validates :boat, presence: :true
   validates :start_date, presence: :true
  validates :end_date, presence: :true

end

