require_relative "../../database.rb"

Pact.provider_states_for "Zoo App" do

  provider_state "an alligator exists" do
    set_up do
      ZOO_DB.insert_an_animal "Betty", "Crocodilus"       
    end
  end

  provider_state "There's no alligator" do
    set_up do
      ZOO_DB.clear
    end
  end

  provider_state "A new animal needs to be created" do
    set_up do
      ZOO_DB.insert_an_animal "Teddy", "teste"
    end
  end

  provider_state "An animal needs to be changed" do
    set_up do
      # Your set up code goes here
    end
  end
end
