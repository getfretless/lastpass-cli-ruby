require 'open3'

module Lastpass
  module CLI
    class Command
      attr_reader :config, :logged_in

      def initialize
        @config = Lastpass::CLI.configuration
        @logged_in = false
        login(username: @config.username)
      end

      def login(username:, trust: false, plaintext_key: false, force: false)
        args = ['lpass', 'login', username]
        args << '--plaintext-key' if plaintext_key
        args << '--force' if force

        out, _, _ = Open3.capture2e(
          { 'LPASS_DISABLE_PINENTRY' => '1' },
          args.join(' '),
          stdin_data: "#{config.password}\n"
        )
        if out.match('Success: Logged in')
          @logged_in = true
        else
          @logged_in = false
        end
        @logged_in
      end

      def logout(force: true)
        args = ['logout']
        args << '--force' if force
        exec_command!(args)
        # Log out: complete.
        @logged_in = false
        !@logged_in
      end

      def ls(sync: 'now')
        raise unless %w[auto now no].include?(sync)
        args = ['ls', '--long']
        args << "--sync=#{sync}"
        exec_command!(args)
      end

      private

      def exec_command!(args)
        command = ['lpass']
        command += args
        out, err = Open3.popen3(*command) do |_stdin, stdout, stderr|
          [stdout.read, stderr.read]
        end
        [out, err]
      rescue StandardError => e
        raise "Failed to execute:\n#{command}\nError: #{e}"
      end
    end
  end
end
