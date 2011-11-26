class HomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @featured_trail = Trail.featured.first
  end

  def destroy
    sign_out :user
    redirect_to root_path
  end
end
