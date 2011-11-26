class Admin::TrailsController < AdminController

  inherit_resources
  respond_to :html
  actions :all, except: [:show]

  def edit
    @trail_location = TrailLocation.new
    super
  end

end
