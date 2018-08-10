class Boat < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :bookings,  dependent: :destroy
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  validates :name, presence: :true
  validates :address, presence: :true
end
