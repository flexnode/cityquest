class Mobile::QuestsController < MobileController

  before_filter :find_quest

  def show
    @user = @quest.user
    @location = @quest.trail_location.location
  end

  def update
    # Check if you are near location
    # @location = @quest.location_trail.location
    # @nearby = Location.find(:all, :origin =>[session[:latitude],session[:longitude]], :within=>1)
    # success = @nearby.map(&:id).include?(@location.id)
        
    @quest.update_attribute(:done, true)
    flash[:success] = "You have checked in to #{@location.address}"
    redirect_to mobile_quest_path(quest)
  end

protected

  def find_quest
     @quest = current_user.quests.find(params[:id])
  end

end
