load_template "/c/pete/trunk/base_template.rb"

# Install restful_authentication plugin
# script/plugin install git://github.com/technoweenie/restful-authentication.git
plugin "restful_authentication", :git => "git://github.com/technoweenie/restful-authentication.git"

# ruby script/generate authenticated user sessions 
generate :authenticated, "user sessions"

# Install role_requirement
# script/plugin install git://github.com/timcharper/role_requirement.git
plugin "role_requirement", :git => "git://github.com/timcharper/role_requirement.git"

# script/generate roles Role User 
generate :roles, "Role User"

rake "db:migrate"


# TODO Make this conditional
# To complete the activation configuration, refer to: 
#    --> http://avnetlabs.com/rails/restful-authentication-with-rails-2
# ruby script/generate authenticated user sessions --include-activation


# Create welcome controller
generate :controller, "welcome index"
route "map.root :controller => 'welcome'"
git :rm => "public/index.html"

git :add => "."
git :commit => "-m 'adding welcome controller'"