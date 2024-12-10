# C8oObservatory

A simple observer/observable message queue framework.  

NOTE: this is [licensed](/LICENSE) under the [GNU LGPL](/LICENSE).  This may or may not make it suitable for your use.  

## Installation

Add to your Gemfile. 

```ruby
gem "c8o_observatory"
```

## Usage

To observe events: 

```ruby
Observatory.observe "some/event" do |event_name, event|
  puts "Received #{event_name} with #{event.data}"
end
```

To notify observers:

```ruby
Observatory.notify "some/event", some: "parameter", number: 123
```
In this case, any observers registered for "some/event" will receive an Observatory::Event with a name of "some/event" and data of `{some: "parameter", number: 123}`

(COMING SOON)
To notify observers with type-specific events:
```ruby
class MyApp::PersonEvent < Data.define(:person, :first_name, :last_name)
  def to_s = "something changed with #{first_name} #{last_name}"
end

Observatory.register "my_app/person_added", MyApp::PersonEvent
Observatory.register "my_app/person_updated", MyApp::PersonEvent

@person = Person.new(first_name: "Brian", last_name: "Munchen")
Observatory.notify "my_app/person_added", person: @person, first_name: @person.first_name, last_name: @person.last_name
@person.first_name = "Bryan"
Observatory.notify "my_app/person_updated", person: @person, first_name: @person.first_name, last_name: @person.last_name
@person.delete
```
Now, any observers registered for "my_app/person_added" or "my_app/person_updated" will receive a MyApp::PersonEvent, with the person, first_name and last_name attributes set accordingly.  



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/c8o_observatory. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/c8o_observatory/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the C8oObservatory project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/c8o_observatory/blob/main/CODE_OF_CONDUCT.md).
