module Twitch
  class Error < StandardError
    def initialize(message, status, body)
      super(message)

      @status = status
      @body = body
    end

    attr_reader :status

    attr_reader :body
  end
end
