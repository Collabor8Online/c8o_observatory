# frozen_string_literal: true

require "plumbing"

module Observatory
  class Hub
    include Plumbing::Actor
    async :observe, :notify

    def initialize
      @pipe = Plumbing::Pipe.new
      @filters = {}
    end

    private def observe(event_name, &observer) = filter_for(event_name.to_s).add_observer(&observer)

    private def notify(event_name, **data) = @pipe.notify(event_name.to_s, **data)

    private def filter_for(event_name)
      @filters[event_name] ||= Plumbing::Pipe::Filter.start(source: @pipe) do |name, *|
        event_name == name
      end
    end
  end
end
