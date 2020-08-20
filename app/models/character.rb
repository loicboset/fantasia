class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :favorites
  has_many :reviews, through: :bookings

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  validates :name, :description, :price_per_day, :image_url, presence: true
  validates :name, uniqueness: true
  validates :price_per_day, numericality: { only_integer: true }
end
