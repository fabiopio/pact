require_relative "../../database.rb"

Pact.provider_states_for "Zoo App" do

  provider_state "an alligator exists" do
    set_up do
      ZOO_DB.insert_an_animal "Betty", "Crocodilus"       
    end
  end

  provider_state "A new animal needs to be created" do
    set_up do
      ZOO_DB.clear
    end
  end
  
end
