require "faraday"
require "base64"

module Espago
  class ApiRequest

    def initialize
      @connection = Faraday.new("https://edge.espago.com/api")
      @connection.headers = {'Authorization' => "Basic #{Base64.encode64("908112077")}"}
    end

    def create(path, method, params = {} )
      klass = path.to_s.capitalize
      binding.pry
    end

    class GetNewClient
    end
  end
end

Espago::ApiRequest.new.create(:new_client, :get )
