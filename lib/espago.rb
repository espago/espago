require "espago/version"
require "espago/client"
require "espago/router"
require "espago/back_request"
require 'forwardable'

module Espago

  class << self
    extend Forwardable

    def_delegators :default_client, :public_key, :app_id, :app_password, :api_version, :send_request, :production
    def_delegators :default_client, :public_key= , :app_id= , :app_password=, :api_version=, :production=

    def method_missing(method, *args, &block)
      if Router.new(method, args[0]).path_exists?
        @default_client.send_request(method, args[0], args[1] || {} )
      else
        super
      end
    end

    private
    def default_client
      @default_client ||= Espago::Client.new
    end
  end
end
