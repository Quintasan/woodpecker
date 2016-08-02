# Woodpecker

A simple API client for [Woodpecker](https://woodpecker.co/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'woodpecker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install woodpecker

## Usage

An API key must be configured for this gem to work. This can be done anywhere in your application as long as it's done before you make any API calls.

```ruby
Woodpecker.configure do |config|
  config.api_key = "insert api key here" # This is required
  config.dummy_password = "insert dummy password here" # This is optional.
end
```

 * `config.api_key` - this is your API key and it's **required**, you can read about how to generate one [here](http://help.woodpecker.co/article/16-api-docs)
 * config.dummy_password - this is **optional** since Woodpecker's API doesn't really care what's here. It's "X" by default.

These keys are available during runtime as:

```ruby
Woodpecker.configuration.api_key
Woodpecker.configuration.dummy_password
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Quintasan/woodpecker.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

