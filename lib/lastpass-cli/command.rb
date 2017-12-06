require 'open3'

module LastpassCLI
  class Command
    def self.run(args, stdin_data: nil)
      raise unless Agent.new.login
      command = [LastpassCLI.configuration.executable]
      command += args
      out, _, _ = Open3.capture2e(*command, stdin_data: stdin_data)
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

    def status(quiet: false)
      args = ['status']
      args << '--quiet' if quiet
      args
    end

    def show(name:, sync: 'now', expand_multi: true)
      raise unless %w[auto now no].include?(sync)
      args = ['show', '--all']
      args << "--sync=#{sync}"
      args << '--expand-multi' if expand_multi
      args << name
      args
    end

    def add(name:, sync: 'now', note_type: nil)
      raise unless %w[auto now no].include?(sync)
      args = ['add', '--non-interactive']
      args << "--sync=#{sync}"
      args << "--note-type=#{note_type}" if note_type
      args << name
    end
  end
end
