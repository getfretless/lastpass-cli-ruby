require 'open3'

module Lastpass
  module CLI
    class Command
      def self.run(args)
        Agent.new.login
        command = [Lastpass::CLI.configuration.executable]
        command += args
        out, _, _ = Open3.capture2e(*command)
        out
      rescue StandardError => e
        raise "Failed to execute:\n#{command}\nError: #{e}"
      end

      def login(username:, trust: false, plaintext_key: false, force: false)
        args = ['login', username]
        args << '--plaintext-key' if plaintext_key
        args << '--force' if force
        args
      end

      def logout(force: true)
        args = ['logout']
        args << '--force' if force
        args
      end

      def ls(sync: 'now')
        raise unless %w[auto now no].include?(sync)
        args = ['ls', '--long']
        args << "--sync=#{sync}"
        args
      end
    end
  end
end
