# frozen_string_literal: true

module Payloads
  module GuestPayloads
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
          guest: {
            first_name: @params[:reservation][:guest_first_name],
            last_name: @params[:reservation][:guest_last_name],
            phone: @params[:reservation][:guest_phone_numbers],
            email: @params[:reservation][:guest_email]
          }
        }
      end
    end
  end
end
