class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :character

  validates :start_date, :end_date, :character_id, :user_id, presence: true
end
