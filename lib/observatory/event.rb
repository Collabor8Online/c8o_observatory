# frozen_string_literal: true

module Observatory
  class Event < Data.define(:name, :data)
    def to_s = "#{name}: #{data}"
  end
end
