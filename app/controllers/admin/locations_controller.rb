class Admin::LocationsController < AdminController

  inherit_resources
  respond_to :html
  actions :all, except: [:show]

end
