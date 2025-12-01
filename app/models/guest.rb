# frozen_string_literal: true

class Guest < ApplicationRecord
  has_many :reservation_guests, dependent: :destroy
  has_many :reservations, through: :reservation_guests
end
