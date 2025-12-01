# frozen_string_literal: true

class Reservation < ApplicationRecord
  has_many :reservation_guests
  has_many :guests, through: :reservation_guests

  # validations
  validate :must_be_valid_date

  def must_be_valid_date
    unless start_date.is_a?(Date) && end_date.is_a?(Date)
      errors.add(:start_date, "must be a valid date")
      errors.add(:end_date, "must be a valid date")
    end
  rescue ArgumentError
    errors.add(:start_date, "must be a valid date")
    errors.add(:end_date, "must be a valid date")
  end
end
