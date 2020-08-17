class Character < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price_per_day, :image_url, presence: true
  validates :name, uniqueness: true
  validates :price_per_day, numericality: { only_integer: true }
end
