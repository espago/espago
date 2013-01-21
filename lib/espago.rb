require "espago/version"
require "espago/client"
require 'forwardable'
require "pry"

module Espago

  class << self
    extend Forwardable

    def_delegators :default_client, :public_key, :app_id, :app_password, :send_request
    def_delegators :default_client, :public_key= , :app_id= , :app_password=

    private
    def default_client
      @default_client ||= Espago::Client.new
    end
  end
end
binding.pry
