# frozen_string_literal: true

FactoryBot.define do
  factory :reservation_guest do
    guest
    reservation
  end
end
