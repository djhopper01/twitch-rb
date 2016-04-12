require 'rspec'
require 'twitch'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
end

def stub_delete(path)
  stub_request(:delete, Twitch::Client::BASE_URL + path)
end

def stub_get(path)
  stub_request(:get, Twitch::Client::BASE_URL + path)
end

def stub_post(path)
  stub_request(:post, Twitch::Client::BASE_URL + path)
end

def stub_put(path)
  stub_request(:put, Twitch::Client::BASE_URL + path)
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end
