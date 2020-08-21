class Character < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo
  geocoded_by :address


  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  validates :name, :description, :price_per_day, :address, presence: true
  validates :name, uniqueness: true
  validates :price_per_day, numericality: { only_integer: true }
  validates :photo, attached: true, unless: :img_url?

  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: {
        prefix: true
      }
    }

  def img_url?
    self.image_url.present?
  end

end
