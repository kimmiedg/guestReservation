# frozen_string_literal: true

class Guest
  has_many :reservation_guests
  has_many :reservations
end
