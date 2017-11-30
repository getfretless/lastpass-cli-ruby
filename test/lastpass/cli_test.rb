require 'test_helper'

class Lastpass::CLITest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Lastpass::CLI::VERSION
  end

  def test_configuration
    # It returns a configuration object
    assert Lastpass::CLI.configuration.is_a?(Lastpass::CLI::Configuration)

    # It keeps track of assigned attributes
    Lastpass::CLI.configure do |config|
      config.login = 'Steve'
    end
    assert Lastpass::CLI.configuration.login == 'Steve'
  end

  def test_configure
    Lastpass::CLI.configure do |config|
      config.login = 'lastpassDude'
      config.password = '!p4$5w0rd'
    end

    config = Lastpass::CLI.configuration
    config.login = 'lastpassDude'
    assert config.password == '!p4$5w0rd'
  end

  def test_reset_configuration
    Lastpass::CLI.configure do |config|
      config.login = 'lastpassDude'
    end
    assert_equal Lastpass::CLI.configuration.login, 'lastpassDude'
    Lastpass::CLI.reset_configuration!
    assert_nil Lastpass::CLI.configuration.login
  end
end
