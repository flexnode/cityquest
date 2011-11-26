class AdminController < ApplicationController
  layout "admin"
  #http_basic_authenticate_with :name => "admin", :password => "admin", :except => :index
end
