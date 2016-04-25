# In specs/service_consumers/pact_helper.rb
require 'pact/provider/rspec'
require_relative '../../server.rb'
require_relative 'provider_states'

Pact.service_provider "Animal Service" do
  honours_pact_with 'Zoo App' do
    pact_uri '/Users/fpio/Documents/pact-example/spec/pacts/zoo_app-animal_service.json'
  end
end
