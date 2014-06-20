require "rack/test"
require "webmock/rspec"

ENV["RACK_ENV"] = "test"
ENV['ENV'] = "test"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  include Rack::Test::Methods


  config.before(:each) do
    Mongoid::Sessions.default.collections.select {|c| c.name !~ /system/}.each {|c| c.find.remove_all}
  end
end
