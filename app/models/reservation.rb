# frozen_string_literal: true

class Reservation < ApplicationRecord
  has_many :reservation_guests
  has_many :guests, through: :reservation_guests

  validate :must_be_valid_date

  def must_be_valid_date
    return if start_date.is_a?(Date) && end_date.is_a?(Date)
    errors.add("Must be valid date")
  rescue ArgumentError
    errors.add("Must be valid date")
  end
end
