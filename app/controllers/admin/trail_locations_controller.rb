class Admin::TrailLocationsController < AdminController

  inherit_resources
  respond_to :html
  actions :all, except: [:show]

end
