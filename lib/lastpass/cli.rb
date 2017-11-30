require "lastpass/cli/version"
require "lastpass/cli/configuration"

module Lastpass
  module CLI
    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.reset_configuration!
      @configuration = Configuration.new
    end

    def self.configure
      yield(configuration)
    end
  end
end
