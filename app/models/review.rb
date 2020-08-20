class Review < ApplicationRecord
  belongs_to :booking
  validates :user_review, :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }, numericality: { only_integer: true }
end
