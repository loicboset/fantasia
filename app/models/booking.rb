class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :character

  validates :start_date, :end_date, :character_id, :user_id, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
