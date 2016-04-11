require 'httparty'
require 'twitch/error'

module Twitch
  module Adapters
    class HTTPartyAdapter < BaseAdapter
      
      def self.request(method, url, options={})
        res = HTTParty.send(method, url, options)

        case res.code

        # Errors from Twitch will be returned as:
        #
        # {
        #     "message":"Invalid Token",
        #     "status":401,
        #     "error":"Unauthorized"
        # }
        when 400...499, 500...599
          raise Twitch::Error.new(res.parsed_response["message"], res.code, res.body)

        # As long as the status code is not one of the
        # above, let's return the response.
        else
          {:body => res, :response => res.code}
        end
      end

    end
  end
end
