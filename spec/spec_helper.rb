require 'rspec'
require 'twitch'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
end
