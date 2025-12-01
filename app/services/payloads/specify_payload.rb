# frozen_string_literal: true

module Payloads
  class SpecifyPayload

    def initialize(params)
      @params = params
    end

    def self.call(params)
      new(params).call
    end

    def call
      detect_payload
    end

    private

    def payload1_keys
      %w[start_date end_date nights guests adults children infants status 
        guest currency payout_price security_price total_price]
    end

    def payload2_keys
      %w[listing_security_price_accurate host_currency nights number_of_guests
        status_type total_paid_amount_accurate guest_email guest_id
        guest_first_name guest_last_name guest_phone_numbers]
    end

    def payload_array
      [
        { 
          payload1: payload1_keys 
        },
        {
          payload2: payload2_keys
        }
      ]
    end

    def detect_payload
      payloads = payload_array
      payloads.each do |payload|
        if payload.values.first.all? {|key| filter_params.key?(key) }
          return payload.keys.first.to_s
        end
      end
      
      nil
    end

    def filter_params
      return @params[:reservation] if @params[:reservation][:guest_details]
      
      @params
    end
  end
end
