class AdminController < ApplicationController
  layout "admin"
  http_basic_authenticate_with :name => "admin", :password => "admin"
  skip_before_filter :authenticate_user!
end
