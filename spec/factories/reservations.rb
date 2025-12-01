# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    start_date { DateTime.now }
    end_date { DateTime.now + 1 }
    no_of_nights { 1 }
    no_of_guests { 2 }
    adults { 2 }
    status { "accepted" }
    currency { "AUD" }
    payout_price { 100.00 }
    security_price { 20.00 }
    total_price { 200.00 }
  end
end
