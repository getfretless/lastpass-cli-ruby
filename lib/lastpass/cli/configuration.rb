module Lastpass
  module CLI
    class Configuration
      attr_accessor :username, :password, :executable

      def initialize
        @executable = 'lpass'
      end
    end
  end
end
