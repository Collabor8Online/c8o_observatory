# C8oObservatory

A simple observer/observable message queue framework.  

NOTE: this is [licensed](/LICENSE) under the [GNU LGPL](/LICENSE).  This may or may not make it suitable for your use.  

## Installation

Add to your Gemfile. 

```ruby
gem "c8o_observatory"
```

## Usage

To notify observers and observe events: 

```ruby
Observatory.notify "some/event", some: "parameter", number: 123

Observatory.observe "some/event" do |event_name, data|
  puts "Received #{event_name} with #{data}"
  # => Received some/event with { some: "parameter", number: 123 }
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Collabor8Online/c8o_observatory. This project is intended to be a safe, welcoming space for collaboration - don't be a dick and assume that everyone you are interacting with is knowledgable and well-intentioned.  

