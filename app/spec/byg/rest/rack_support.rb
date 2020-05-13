# frozen_string_literal: true

require 'rack/test'

# REST API application for tests
module RackSupport
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

RSpec.configure do |config|
  config.include RackSupport
end
