require 'test_helper'

class Lastpass::CLI::ConfigurationTest < Minitest::Test
  def test_block_configuration
    Lastpass::CLI.configure do |config|
      config.login = 'Dave'
    end
    assert Lastpass::CLI.configuration.login == 'Dave'
  end

  def test_object_configuration
    config = Lastpass::CLI::Configuration.new
    config.password = 'H3yBUddy'
    assert config.password = 'H3yBuddy'
  end
end
