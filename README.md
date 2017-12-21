# LastPassCLI-Ruby

LastPassCLI-Ruby uses the [LastPass Command Line Interface](https://github.com/lastpass/lastpass-cli) to add passwords, notes, and other secure items to the LastPass password management service, and to read those same items.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lastpass-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lastpass-cli

Add your LastPass credentials to environment variables named `LASTPASS_EMAIL` and `LASTPASS_PASSWORD`. For development and test environments, consider using something like [dotenv](https://github.com/bkeepers/dotenv).

For use with Ruby on Rails, create the initializer with the following command:

```
rails generate lastpass_cli
```

If you're not using Rails, configure the gem like this:

```rb
LastpassCLI.configure do |config|
  config.username = ENV['LASTPASS_EMAIL']
  config.password = ENV['LASTPASS_PASSWORD']
end
```

Since LastPassCLI-Ruby is a wrapper for [lastpass-cli](https://github.com/lastpass/lastpass-cli), you'll need to install that too.

For Linux, FreeBSD, or Cygwin, see the [installation instructions in the README](https://github.com/lastpass/lastpass-cli#installing-on-linux).

For macOS or OS X, you can install `lastpass-cli` with [Homebrew](http://brew.sh/) (`brew install lastpass-cli --with-pinentry`) or [MacPorts](https://www.macports.org/) (`sudo port install lastpass-cli`).

## Usage

### Reading items from LastPass

Look up items by Unique ID or name (with optional folder).

```rb
LastpassCLI.show("SOME_UNIQUE_ID")  # by Unique ID
LastpassCLI.show("github")          # by name
LastpassCLI.show("social/linkedin") # by name with folder
LastpassCLI.show("ssn")             # works with non-password items as well
```

### Adding items to LastPass

```rb
LastpassCLI.add_password(
    "social/twitter",
    username: "someone",
    password: "$0m3thing-$3cr3t!",
    url: "https://twitter.com",
    notes: "Use it wisely."
)
```

You can also check out the [usage instructions for `lastpass-cli` itself](https://lastpass.github.io/lastpass-cli/lpass.1.html).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

For convenience, you may want to add your LastPass credentials to `bin/console`, but remember not to commit them to the repository! For example, just above `Pry.start` in `bin/console`:

```rb
LastpassCLI.configure do |config|
  config.username = "myLastpassUsername"
  config.password = "My LastPass passw0rd!"
end
```

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/QuantifiAi/lastpass-cli.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
