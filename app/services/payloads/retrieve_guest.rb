# frozen_string_literal: true

module Payloads
  class RetrieveGuest

    def initialize(params)
      @params = params
    end

    def self.call(params)
      new(params).call
    end

    def call
      get_guest
    end

    private

    def get_guest
      return find_guest if find_guest.present?

      g = Guest.create(guest_params)
      return g if g.valid? && g.persisted?

      raise Errors::UnrecognizedPayload, "Guest payload is not recognized" 
    end

    def payload_params
      payload_name = Payloads::SpecifyPayload.call(@params)
      if payload_name.present?
        payload_name = payload_name.downcase.capitalize
        return "Payloads::GuestPayloads::#{payload_name}Params".safe_constantize.call(@params)
      end

      raise Errors::UnrecognizedPayload, "Payload is not recognized" 
    end

    def guest_params
      ActionController::Parameters.new(payload_params)
                                  .require(:guest)
                                  .permit(:first_name, :last_name, :email, phone: [])
    end

    def find_guest
      Guest.find_by(email: payload_params[:guest][:email])
    end
  end
end
