require 'test_helper'

describe Lastpass::CLI do
  after do
    Lastpass::CLI.reset_configuration!
  end

  it 'has a version number' do
    assert ::Lastpass::CLI::VERSION != nil
  end

  describe '::configuration' do
    it 'returns a configuration object' do
      assert ::Lastpass::CLI.configuration.is_a?(::Lastpass::CLI::Configuration)
    end

    it 'keeps track of assigned attributes' do
      Lastpass::CLI.configure do |config|
        config.username = 'Steve'
      end
      assert_equal 'Steve', Lastpass::CLI.configuration.username

      Lastpass::CLI.configuration.password = 'p4$$w0rd'
      assert_equal 'p4$$w0rd', Lastpass::CLI.configuration.password
    end
  end

  describe '::reset_configuration!' do
    it 'resets the configuration' do
      Lastpass::CLI.configure do |config|
        config.username = 'lastpassDude'
      end
      assert_equal Lastpass::CLI.configuration.username, 'lastpassDude'
      Lastpass::CLI.reset_configuration!
      assert_nil Lastpass::CLI.configuration.username
    end
  end

  describe '::configure' do
    it 'accepts a block to assign configuration' do
      Lastpass::CLI.configure do |config|
        config.username = 'lastpassDude'
        config.password = '!p4$5w0rd'
      end
      config = Lastpass::CLI.configuration
      assert_equal '!p4$5w0rd', config.password
      assert_equal 'lastpassDude', config.username
    end
  end
end
