class Admin::TrailLocationsController < AdminController
  inherit_resources

  belongs_to :trails, :param => :trail_id
  respond_to :html
  actions :all, except: [:show]


  def create
    create! do |success, failure|
      success.html { redirect_to edit_admin_trail_path(@trail_location.trail_id) }
      failure.html do 
        flash[:error] = "You added an invalid location"
        redirect_to edit_admin_trail_path(@trail_location.trail_id)
      end
    end
  end

  def destroy
    destroy!  { redirect_to edit_admin_trail_path(@trail_location.trail_id) }
  end


end
