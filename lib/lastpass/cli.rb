require "lastpass/cli/version"
require "lastpass/cli/configuration"
require "lastpass/cli/agent"
require "lastpass/cli/command"
require "lastpass/cli/item"

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

    def self.items
      items = []
      out = Command.run(Command.new.ls)
      if !out.nil? && out != ""
        out.each_line do |line|
          match_data = line.match(/(?<modified_at>\d{4}-\d{2}-\d{2} \d{2}:\d{2}) (?<folder>.+)\/(?<name>.+) \[id: (?<id>.*)\] \[username:\s?(?<username>.+)\]/)
          attributes = Hash[match_data.names.zip(match_data.captures)]
          items << Item.new(attributes)
        end
      end
      items
    end
        end
      end
      items
    end
  end
end
