class Admin::LocationsController < AdminController

  inherit_resources
  respond_to :html
  actions :all, except: [:show]

  def index  
    if params[:search].present?  
      @locations = Location.near(params[:search], 2, :order => :distance)  
    else  
      @locations = Location.all  
    end  
  end


  def new
    if params[:query].present?  
      @search_results = Foursquare.search(params[:query])
    end
    super
  end
  
end
