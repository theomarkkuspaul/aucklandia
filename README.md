# Aucklandia

Ruby wrapper gem for the Auckland Transport API (still in the works). Get messed up on all of ATs delicious data. Submit a PR if you want.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aucklandia'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aucklandia

## Usage

To interact with Auckland Transport's API, simply instantiate a client:

```ruby
client = Aucklandia::Client.new('<AT-API-KEY>')
```

Examples

```ruby
# GET all routes
client.get_routes

# GET all routes by route short name identifier
route_short_name = "OUT"
client.get_routes_by_short_name(route_short_name)

# GET all trips by route ID
route_id = '12345'
client.get_trips_by_route_id(route_id)

# GET all live vehicle positions
client.get_vehicle_positions

# GET all live vehicles positions by trip ID
trip_id = '<trip-id>'
client.get_vehicle_positions(trip_id)

# GET all live vehicle positions by route ID
route_id = '<route-id>'
client.get_vehicle_positions_by_route_id(route_id)

# GET all shape points by trip ID
trip_id = '<trip-id>'
client.get_shapes_by_trip(trip_id)

# GET all versions
client.get_versions
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/aucklandia. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Aucklandia project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/aucklandia/blob/master/CODE_OF_CONDUCT.md).
