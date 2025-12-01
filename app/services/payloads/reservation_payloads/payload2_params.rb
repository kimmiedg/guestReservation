# frozen_string_literal: true

module Payloads
  module ReservationPayloads
    class Payload2Params
      def initialize(params)
        @params = params
      end

      def self.call(params)
        new(params).call
      end

      def call
        transform_keys
      end

      private

      def transform_keys
        {
          reservation: reservation_attributes
        }
      end

      def reservation_attributes
        {
          start_date: Date.parse(reservation[:start_date]),
          end_date: Date.parse(reservation[:end_date]),
          no_of_nights: reservation[:nights],
          no_of_guests: reservation[:number_of_guests],
          adults: guest_details[:number_of_adults],
          infants: guest_details[:number_of_infants],
          children: guest_details[:number_of_children],
          status: reservation[:status_type],
          currency: reservation[:host_currency],
          payout_price: reservation[:expected_payout_amount],
          security_price: reservation[:listing_security_price_accurate],
          total_price: reservation[:total_paid_amount_accurate]
        }
      end

      def reservation
        @reservation ||= @params[:reservation]
      end

      def guest_details
        @guest_details ||= reservation[:guest_details] || {}
      end
    end
  end
end
