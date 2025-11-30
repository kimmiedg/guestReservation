# frozen_string_literal: true

class ReservationGuest < ApplicationRecord
  belongs_to :reservation
  belongs_to :guest
end
