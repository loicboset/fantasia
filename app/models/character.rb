class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :favorites
  has_many :reviews, through: :bookings
  has_one_attached :photo

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  validates :name, :description, :price_per_day, presence: true
  validates :name, uniqueness: true
  validates :price_per_day, numericality: { only_integer: true }

  validates :photo, attached: true, unless: :img_url?

  def img_url?
    self.image_url.present?
  end
end
