# frozen_string_literal: true

module Payloads
  module ReservationPayloads
    class Payload1Params
      attr_reader :params

      ATTRIBUTE_MAP = {
        nights: :no_of_nights,
        guests: :no_of_guests,
        adults: :adults,
        infants: :infants,
        children: :children,
        status: :status,
        currency: :currency,
        payout_price: :payout_price,
        security_price: :security_price,
        total_price: :total_price
      }.freeze

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
        parsed_dates.merge(mapped_attributes)
      end

      def parsed_dates
        {
          start_date: Date.parse(params[:start_date]),
          end_date: Date.parse(params[:end_date])
        }
      end

      def mapped_attributes
        ATTRIBUTE_MAP.to_h { |source, target| [target, params[source]] }
      end
    end
  end
end
