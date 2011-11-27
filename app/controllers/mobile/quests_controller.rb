class Mobile::QuestsController < MobileController

  before_filter :find_quest, :only => [:show]

  def index
    
  end

  def join
    @trail = Trail.find(params[:id])
    @trail.trail_locations.each do |tl|
      current_user.quests.create(:name => @trail.name, :trail_id => @trail.id, :trail_location_id => tl.id) 
    end
    flash[:success] = "You can start your quest #{@trail.name}"
    redirect_to mobile_profile_path
  end

  def show
    @user = @quest.user
    @location = @quest.trail_location.location
  end

  def update
    # Check if you are near location
    # @location = @quest.location_trail.location
    # @nearby = Location.find(:all, :origin =>[session[:latitude],session[:longitude]], :within=>1)
    # success = @nearby.map(&:id).include?(@location.id)
    @location = Location.find(params[:id])
    @trail_location = @location.trail_locations[0]
  
    quest = current_user.quests.find_or_create_by_name_and_trail_id_and_trail_location_id(:name => @trail_location.trail.name, :trail_id => @trail_location.trail.id, :trail_location_id => @trail_location.id, :done => true)   
    # @quest.update_attribute(:done, true)
    flash[:success] = "You have checked in to #{@location.address}"
    redirect_to mobile_quest_path(quest)
  end

protected

  def find_quest
     @quest = current_user.quests.find(params[:id])
  end

end
