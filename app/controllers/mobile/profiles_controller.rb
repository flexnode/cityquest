class Mobile::ProfilesController < MobileController


  def show
    @trail = Trail.featured.first
    @locations = @trail.locations
  end

  def quests
    @trails = Trail.all
  end

end
