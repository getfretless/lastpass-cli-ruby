require 'test_helper'

describe LastpassCLI do
  after do
    LastpassCLI.reset_configuration!
  end

  it 'has a version number' do
    assert ::LastpassCLI::VERSION != nil
  end

  describe '::configuration' do
    it 'returns a configuration object' do
      assert ::LastpassCLI.configuration.is_a?(::LastpassCLI::Configuration)
    end

    it 'keeps track of assigned attributes' do
      LastpassCLI.configure do |config|
        config.username = 'Steve'
      end
      assert_equal 'Steve', LastpassCLI.configuration.username

      LastpassCLI.configuration.password = 'p4$$w0rd'
      assert_equal 'p4$$w0rd', LastpassCLI.configuration.password
    end
  end

  describe '::reset_configuration!' do
    it 'resets the configuration' do
      LastpassCLI.configure do |config|
        config.username = 'lastpassDude'
      end
      assert_equal LastpassCLI.configuration.username, 'lastpassDude'
      LastpassCLI.reset_configuration!
      assert_nil LastpassCLI.configuration.username
    end
  end

  describe '::configure' do
    it 'accepts a block to assign configuration' do
      LastpassCLI.configure do |config|
        config.username = 'lastpassDude'
        config.password = '!p4$5w0rd'
      end
      config = LastpassCLI.configuration
      assert_equal '!p4$5w0rd', config.password
      assert_equal 'lastpassDude', config.username
    end
  end
end
