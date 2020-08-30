# Weekdone CLI
CLI for weekdone

## Usage

1. Register [weekdone-sdk](https://github.com/thaim/weekdone-sdk-ruby) application to [weekdone.com](https://weekdone.com/settings?tab=application).
2. Configure your `Client ID` and `Client Secret` as environment variable `WEEKDONE_CLIENT_ID` and `WEEKDONE_CLIENT_SECRET`.
3. Loging by running `$ weekdone login`. Make sure you have to paste Oauth2 code to stdin.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weekdone-cli'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install weekdone-cli

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thaim/weekdone-cli.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
