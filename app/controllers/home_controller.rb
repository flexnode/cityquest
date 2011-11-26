class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @featured_trail = Trail.featured.first
  end

end
