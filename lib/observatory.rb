# frozen_string_literal: true

require_relative "observatory/version"
require_relative "observatory/event"
require_relative "observatory/hub"

module Observatory
  class Error < StandardError; end

  def self.observe(event_name, &observer) = @hub.observe(event_name, &observer)

  def self.notify(event_name, **data) = @hub.notify(event_name, **data)

  @hub = Observatory::Hub.start
end
