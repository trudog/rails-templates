load_template "http://github.com/trudog/rails-templates/raw/master/base.rb"

# Install restful_authentication plugin
# script/plugin install git://github.com/technoweenie/restful-authentication.git
plugin "restful_authentication", :git => "git://github.com/technoweenie/restful-authentication.git"

# ruby script/generate authenticated user sessions 
puts "\n\n"
if yes?("Account Activation Using Email?")
  # To complete the activation configuration, refer to: 
  #   --> http://avnetlabs.com/rails/restful-authentication-with-rails-2
  puts "Email account activation selected"
  generate :authenticated, "user sessions --include-activation"
else
  puts "No account activation"
  generate :authenticated, "user sessions"
end

# Install role_requirement
# script/plugin install git://github.com/timcharper/role_requirement.git
plugin "role_requirement", :git => "git://github.com/timcharper/role_requirement.git"

# script/generate roles Role User 
generate :roles, "Role User"

rake "db:migrate"

# TODO need to make this conditional 
# Create welcome controller
generate :controller, "welcome index"
route "map.root :controller => 'welcome'"
git :rm => "public/index.html"
git :add => "."
git :commit => "-m 'adding welcome controller'"