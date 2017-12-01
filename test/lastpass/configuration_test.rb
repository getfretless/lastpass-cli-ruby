require 'test_helper'

describe Lastpass::CLI::Configuration do
  it 'stores configuration values' do
    config = Lastpass::CLI::Configuration.new
    config.password = 'H3yBUddy'
    assert_equal 'H3yBUddy', config.password
    config.username = 'Dave'
    assert_equal 'Dave', config.username
  end
end
