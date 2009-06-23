#Base template
if yes?("Do you want to use RSpec for testing?")
  plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
  plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
  generate :rspec
end

#Nifty generators
if yes?("Do you want to use Nifty Generator?")
 plugin "nifty-generators", :git => "git://github.com/ryanb/nifty-generators.git"
 
 #rake('gems:install', :sudo => true)

 generate :nifty_layout
end
 
git :init
 
run "echo 'TODO add readme content' > README"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"
 
file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END
 
git :add => ".", :commit => "-m 'initial commit'"
