A simple project based on Pact tutorial using the consumer driven contract testing as strategy.

As explained on Pact repository, your Consumer contracts will be generated based on the specs you have created, in this example you can find in this path: pact-example/spec/animal_service_client_spec.rb. The contracts will be generated in pact-example/spec/pacts as zoo_app-animal_service.json once the command rspec is ran.

Since this is just an example in how to use Pact to check contracts between Consumer and Provider, the Webmachine framework was implemented on the same repository only for file tracking. In theory, Consumer e Provides are going to be developed in different sides. In order to check the Pact between the Provider (Animal Service) and Consumer (Zoo App) you only need to run inside the webmachine folder the following command: rake pact:verify

More information about configuration files and the project structure suggested by Pact, see the Pact page: https://github.com/realestate-com-au/pact
