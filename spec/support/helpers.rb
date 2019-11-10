# frozen_string_literal: true

require 'support/helpers/request_helpers'
RSpec.configure do |config|
  config.include Request::JsonHelpers, type: :controller
  config.include Request::HeadersHelpers, type: :controller

  config.before(:each, type: :controller) do
    include_default_accept_headers
  end


end
