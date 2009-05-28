run "echo TODO > README"

# Run Scripts

# Install Gems
gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
rake "gems:install"

# Install Plugins
plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
generate :rspec

# FYI: This allows you to configure git
#git config --global user.name 'Your Name'
#git config --global user.email ben@domain.com

# Create Git repository
if yes?("Create Git?")
  git :init

  file ".gitignore", <<-END
  .DS_Store
  log/*.log
  tmp/**/*
  config/database.yml
  db/*.sqlite3
  END

  run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
  run "cp config/database.yml config/example_database.yml"

  git :add => "."
  git :commit => "-m 'initial import'"
end
