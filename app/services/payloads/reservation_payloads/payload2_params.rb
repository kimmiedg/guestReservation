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
        reservation: {
          start_date:   Date.parse(@params[:reservation][:start_date]),
          end_date:     Date.parse(@params[:reservation][:end_date]),
          no_of_nights: @params[:reservation][:nights],
          no_of_guests: @params[:reservation][:number_of_guests],
          adults:       @params[:reservation][:guest_details][:number_of_adults],
          infants:      @params[:reservation][:guest_details][:number_of_infants],
          children:     @params[:reservation][:guest_details][:number_of_children],
          status:       @params[:reservation][:status_type],
          currency:     @params[:reservation][:host_currency],
          payout_price: @params[:reservation][:expected_payout_amount],
          security_price: @params[:reservation][:listing_security_price_accurate],
          total_price:  @params[:reservation][:total_paid_amount_accurate]
        }
      }
    end

    def get_guests_count
      guests = @params[:reservation][:guest_details][:localized_description]
      guests.match(/\d+/)[0].to_i
    end
  end
end
end
