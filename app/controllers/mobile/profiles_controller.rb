class Mobile::ProfilesController < MobileController


  def show
    @trail = Trail.featured.first
    @locations = @trail.locations

    @nearby = Location.near([session[:latitude].to_f, session[:longitude].to_f], 2).first
  end

  def quests
    @trails = Trail.all
  end

end
