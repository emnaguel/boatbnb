class Boat < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  validates :name, presence: :true
  validates :address, presence: :true
end
