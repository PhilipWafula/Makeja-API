# frozen_string_literal: true

class ApplicationController < ActionController::API
  # Doorkeeper code
  before_action :doorkeeper_authorize!
  respond_to :json
end
