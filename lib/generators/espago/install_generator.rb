require 'securerandom'

module Espago
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates a Espago initializer"

      def copy_initializer
        template "espago.rb", "config/initializers/espago.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end

    end
  end
end
