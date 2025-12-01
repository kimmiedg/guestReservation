# frozen_string_literal: true

module Api
module V1
  class GuestBlueprint < Blueprinter::Base
    identifier :id

    fields :first_name,
           :last_name,
           :phone,
           :email
  end
end
end
