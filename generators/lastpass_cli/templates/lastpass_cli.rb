# LastPass CLI Global Configuration
#
# Use this to set up shared configuration options for your entire application.
#
# To learn more, check out the README:
#
# https://github.com/QuantifiAi/lastpass-cli-ruby/blob/master/README.md

LastpassCLI.configure do |config|
  # Credentials of the LastPass account to sync with
  # Stored in an environment variable, by default
  config.username = ENV['LASTPASS_EMAIL']
  config.password = ENV['LASTPASS_PASSWORD']
end
