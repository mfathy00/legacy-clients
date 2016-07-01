require "rack/test"
require "rspec"

ENV["RACK_ENV"] = "test"

require File.expand_path "../../boot.rb", __FILE__

require "app"

module RSpecMixin
  include Rack::Test::Methods

  def app
    described_class
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
end
