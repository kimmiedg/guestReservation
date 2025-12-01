# frozen_string_literal: true

module Payloads
module ReservationPayloads
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
        reservation: {
          start_date:   Date.parse(@params[:start_date]),
          end_date:     Date.parse(@params[:end_date]),
          no_of_nights: @params[:nights],
          no_of_guests: @params[:guests],
          adults:       @params[:adults],
          infants:      @params[:infants],
          children:     @params[:children],
          status:       @params[:status],
          currency:     @params[:currency],
          payout_price: @params[:payout_price],
          security_price: @params[:security_price],
          total_price:  @params[:total_price]
        }
      }
    end
  end
end
end
