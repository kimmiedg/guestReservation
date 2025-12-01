# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      rescue_from Errors::UnrecognizedPayload do |e|
        render json: { error: e.message }, status: :bad_request
      end
    end
  end
end
