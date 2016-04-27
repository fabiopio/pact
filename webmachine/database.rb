require "sequel"

class ZooDB
	def initialize
		db = Sequel.sqlite

		db.create_table :animals do
  			primary_key :id
  			String :name
  			String :specie
  		end

  		@animals = db[:animals]
	end

	def insert_an_animal(name, specie)
		@animals.insert(:name => name, :specie => specie)
	end

	def get_first_animal
		@animals.first
	end

	def clear
		@animals.delete
	end

	def next_id
		last = @animals.order(:id).last

		last.nil? ? 0 : last.id + 1
	end
end

ZOO_DB = ZooDB.new