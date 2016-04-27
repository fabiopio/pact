require 'spec_helper'

describe AnimalServiceClient, :pact => true do

  before do
    AnimalServiceClient.base_uri 'localhost:1234'
  end

  subject { AnimalServiceClient.new }

  describe "get_alligator" do
    before do
      animal_service.given("an alligator exists").
        upon_receiving("a request for an alligator").
        with(method: :get, path: '/alligator', query: '').
        will_respond_with(
          status: 200,
          headers: {'Content-Type' => 'application/json'},
          body: {name: 'Betty'})
    end

    it "returns a alligator" do
      expect(subject.get_alligator).to eq(Alligator.new('Betty'))
    end
  end

   describe "get_alligator_specie" do
    before do
      animal_service.given("an alligator exists").
      upon_receiving("a request for an alligator specie").
        with(method: :get, path: '/alligator', query: '').
        will_respond_with(
          status: 200,
          headers: {'Content-Type' => 'application/json'},
          body: {name: 'Betty', specie: 'Crocodilus'} )
    end

    it "returns an alligator specie" do
      expect(subject.get_alligator).to eq(Alligator.new('Betty'))
      expect(subject.get_alligator_specie).to eq(Alligator.new('Crocodilus'))
    end
  end
  
end