require 'webmachine'
require 'webmachine/adapters/rack'
require 'json'
require_relative 'database.rb'

class Alligator < Webmachine::Resource
  def content_types_provided
    [["application/json", :to_json]]
  end

  def to_json
    @animal.to_json
  end

  def resource_exists?
    @animal = ZOO_DB.get_first_animal
  end

end

Webmachine.application.routes do
  add ["alligator"], Alligator
end

Webmachine.application.configure do |config|
  config.adapter = :Rack
end