# frozen_string_literal: true

module Payloads
  class CreateReservation
    def initialize(params)
      @params = params
    end

    def self.call(params)
      new(params).call
    end

    def call
      create_reservation
    end

    private

    def create_reservation
      guest = transform_guest_payload
      reservation = Reservation.new(reservation_params)
      
      failure(reservation.errors.full_messages.join(", ")) unless reservation.valid? && reservation.persisted?
      failure("Guest is invalid") if guest.blank?

      reservation.guests << guest 
      reservation.save!
      reservation
    end

    def failure(msg)
      { status: :error, message: msg }
    end

    def payload_params
      payload_name = Payloads::SpecifyPayload.call(@params).downcase.capitalize
      "Payloads::ReservationPayloads::#{payload_name}Params".safe_constantize.call(@params)
    end

    def reservation_params
      ActionController::Parameters.new(payload_params)
                                  .require(:reservation)
                                  .permit(:start_date, :end_date, :no_of_nights, :no_of_guests,
                                          :adults, :infants, :children, :status, :currency, 
                                          :payout_price, :security_price, :total_price)
    end

    def transform_guest_payload
      Payloads::RetrieveGuest.call(@params)
    end
  end
end
