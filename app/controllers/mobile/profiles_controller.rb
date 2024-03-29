class Mobile::ProfilesController < MobileController


  def show
    @trail = Trail.featured.first
    @locations = @trail.locations

    @nearby = @trail.locations.near([session[:latitude].to_f, session[:longitude].to_f], 2).first
    @nearby = Location.first if @nearby.blank?
  end

  def quests
    @trails = Trail.all
  end

end
