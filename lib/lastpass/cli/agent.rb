module Lastpass
  module CLI
    class Agent
      attr_reader :logged_in, :config

      def initialize
        @config = Lastpass::CLI.configuration
      end

      def login
        return true if logged_in?
        command = [config.executable]
        command += Command.new.login(username: config.username)
        out, _, _ = Open3.capture2e(
          { 'LPASS_DISABLE_PINENTRY' => '1' },
          *command,
          stdin_data: "#{config.password}\n"
        )
        @logged_in = !!out.match('Success: Logged in')
      end

      def logout
        return true if logged_out?
        command = [config.executable]
        command += Command.new.logout
        out, _, _ = Open3.capture2e(*command)
        !!out.match('Log out: complete')
      end

      def logged_in?
        command = [config.executable]
        command += Command.new.status
        out, _, _ = Open3.capture2e(*command)
        !!out.match('Logged in as')
      end

      def logged_out?
        !logged_in?
      end
    end
  end
end
