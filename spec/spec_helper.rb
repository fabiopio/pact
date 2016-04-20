require 'pact/consumer/rspec'
require './animal_service_client'
require './app/models/alligator'

Pact.service_consumer "Zoo App" do
  has_pact_with "Animal Service" do
    mock_service :animal_service do
      port 1234
    end
  end
end
