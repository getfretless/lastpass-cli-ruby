require 'test_helper'

describe LastpassCLI::Configuration do
  it 'stores configuration values' do
    config = LastpassCLI::Configuration.new
    config.password = 'H3yBUddy'
    assert_equal 'H3yBUddy', config.password
    config.username = 'Dave'
    assert_equal 'Dave', config.username
  end
end
