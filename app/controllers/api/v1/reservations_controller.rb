# frozen_string_literal: true

module Api
  module V1
    class ReservationsController < BaseController
      def create
        reservation = Payloads::CreateReservation.call(params)

        render json: Api::V1::ReservationBlueprint.render(reservation)
      end
    end
  end
end
