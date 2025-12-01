# frozen_string_literal: true

module Payloads
  module GuestPayloads
    class Payload1Params
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
            first_name: @params[:guest][:first_name],
            last_name: @params[:guest][:last_name],
            phone: [@params[:guest][:phone]],
            email: @params[:guest][:email]
          }
        }
      end
    end
  end
end
