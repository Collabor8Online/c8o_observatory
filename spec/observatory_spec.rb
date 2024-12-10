# frozen_string_literal: true

RSpec.describe Observatory do
  it "has a version number" do
    expect(Observatory::VERSION).not_to be nil
  end
end
