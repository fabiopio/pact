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

class AlligatorPost < Webmachine::Resource
  def allowed_methods
    ['POST']
  end

  def post_is_create?
    true
  end

  def content_types_accepted
    [["application/json", :from_json]]
  end

  def create_path
    "/alligator/#{next_id}"
  end

  def from_json
    response.body = new_alligator.to_json
  end

  def next_id
    @id ||= ZOO_DB.next_id
  end

  def new_alligator
    @new_alligator ||= ZOO_DB.insert_an_animal("Teddy", "")
  end
end

Webmachine.application.routes do
  add ["alligator"], Alligator

end

Webmachine.application.configure do |config|
  config.adapter = :Rack
end