require "spec_helper"

RSpec.describe Observatory::Hub do
  Plumbing::Spec.modes do
    context "in #{Plumbing.config.mode} mode" do
      it "observes and notifies" do
        hub = Observatory::Hub.start
        observations = []

        hub.observe "test" do |name, data|
          observations << [name, data]
        end

        hub.notify "test", some: "data"

        expect { observations.size }.to become 1
        expect(observations.first).to eq ["test", {some: "data"}]
      end

      it "filters other events" do
        hub = Observatory::Hub.start
        observations = []

        hub.observe "test" do |name, data|
          observations << [name, data]
        end

        await { hub.notify "not.test", some: "data" }

        expect(observations).to be_empty
      end
    end
  end
end
