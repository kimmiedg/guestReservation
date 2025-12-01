# frozen_string_literal: true

module Api
module V1
  class ReservationBlueprint < Blueprinter::Base
    identifier :id

    fields  :start_date,
            :end_date,
            :no_of_guests,
            :no_of_nights,
            :adults,
            :children,
            :infants,
            :currency,
            :status,
            :payout_price, 
            :security_price, 
            :total_price

    field :guests do |reservation, _options|
      GuestBlueprint.render_as_hash(reservation.guests)
    end

    field :total_price do |obj|
      sprintf('%.2f', obj.total_price.to_f)
    end

    field :payout_price do |obj|
      sprintf('%.2f', obj.payout_price.to_f)
    end

    field :security_price do |obj|
      sprintf('%.2f', obj.security_price.to_f)
    end
  end
end
end
