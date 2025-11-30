# frozen_string_literal: true

class ReservationGuest
  belongs_to :reservation
  belongs_to :guest
end
