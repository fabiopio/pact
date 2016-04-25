# In Rakefile
require 'pact/tasks'

# Remember to add it to your default Rake task
task :default => 'pact:verify'