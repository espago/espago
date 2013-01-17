require 'singleton'

module Espago
  class Options
    include Singleton

    class << self
      attr_accessor :public_key, :app_id

      def config
        yield self if block_given?
      end
    end
  end
end