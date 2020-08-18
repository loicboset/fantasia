class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :favorites
  has_many :reviews, through: :bookings

  validates :name, :description, :price_per_day, :image_url, presence: true
  validates :name, uniqueness: true
  validates :price_per_day, numericality: { only_integer: true }
end
