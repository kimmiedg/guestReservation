# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api/V1/Reservations", type: :request do
  describe "POST /reservations" do
    context "when posting payload 1" do
      let(:payload1) do
        {
          start_date: "2021-03-12",
          end_date: "2021-03-16",
          nights: 4,
          guests: 4,
          adults: 2,
          children: 2,
          infants: 0,
          status: "accepted",
          guest: {
            id: 1,
            first_name: "Wayne",
            last_name: "Woodbridge",
            phone: "639123456789",
            email: "wayne_woodbridge@bnb.com"
          },
          currency: "AUD",
          payout_price: "3800.00",
          security_price: "500",
          total_price: "4500.00"
        }
      end

      it "creates new reservation" do
        post "/api/v1/reservations", params: payload1

        res = JSON.parse(response.body)
        expect(payload1[:start_date]).to eq(res["start_date"])
        expect(payload1[:end_date]).to eq(res["end_date"])
        expect(payload1[:nights]).to eq(res["no_of_nights"])
        expect(payload1[:guests]).to eq(res["no_of_guests"])
        expect(payload1[:adults]).to eq(res["adults"])
        expect(payload1[:children]).to eq(res["children"])
        expect(payload1[:infants]).to eq(res["infants"])
        expect(payload1[:guest][:first_name]).to eq(res["guests"].first["first_name"])
        expect(payload1[:guest][:last_name]).to eq(res["guests"].first["last_name"])
        expect([payload1[:guest][:phone]]).to eq(res["guests"].first["phone"])
        expect(payload1[:guest][:email]).to eq(res["guests"].first["email"])
      end
    end

    context "when posting payload 2" do
      let(:payload2) do
        {
          reservation: {
            start_date: "2021-03-12",
            end_date: "2021-03-16",
            expected_payout_amount: "3800.00",
            guest_details: {
              localized_description: "4 guests",
              number_of_adults: 2,
              number_of_children: 2,
              number_of_infants: 0
            },
            guest_email: "wayne_woodbridge@bnb.com",
            guest_first_name: "Wayne",
            guest_id: 1,
            guest_last_name: "Woodbridge",
            guest_phone_numbers: %w[639123456789 639123456789],
            listing_security_price_accurate: "500.00",
            host_currency: "AUD",
            nights: 4,
            number_of_guests: 4,
            status_type: "accepted",
            total_paid_amount_accurate: "4500.00"
          }
        }
      end

      it "creates new reservation" do
        post "/api/v1/reservations", params: payload2

        res = JSON.parse(response.body)
        expect(payload2[:reservation][:start_date]).to eq(res["start_date"])
        expect(payload2[:reservation][:end_date]).to eq(res["end_date"])
        expect(payload2[:reservation][:expected_payout_amount]).to eq(res["payout_price"])
        expect(payload2[:reservation][:guest_details][:number_of_adults]).to eq(res["adults"])
        expect(payload2[:reservation][:nights]).to eq(res["no_of_nights"])
        expect(payload2[:reservation][:number_of_guests]).to eq(res["no_of_guests"])
        expect(payload2[:reservation][:status_type]).to eq(res["status"])
        expect(payload2[:reservation][:total_paid_amount_accurate]).to eq(res["total_price"])
        expect(payload2[:reservation][:listing_security_price_accurate]).to eq(res["security_price"])
        expect(payload2[:reservation][:guest_first_name]).to eq(res["guests"].first["first_name"])
        expect(payload2[:reservation][:guest_last_name]).to eq(res["guests"].first["last_name"])
        expect(payload2[:reservation][:guest_phone_numbers]).to eq(res["guests"].first["phone"])
        expect(payload2[:reservation][:guest_email]).to eq(res["guests"].first["email"])
      end
    end
  end
end
