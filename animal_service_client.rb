require 'httparty'

class AnimalServiceClient
	include HTTParty
		base_uri 'http://animal-service.com'

	def get_alligator
		name = JSON.parse(self.class.get("/alligator").body)['name']
		Alligator.new(name)
	end

	def get_alligator_specie
		specie = JSON.parse(self.class.get("/alligator").body)['specie']
		 Alligator.new(specie)
	end

	def post_alligator
		name = JSON.parse(self.class.post("/alligator", headers: {"Content-Type" => "application/json"}).body)['name']
		Alligator.new(name)
	end
	
end
