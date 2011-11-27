class Api::UsersController < ApplicationController
  respond_to :json

  def update
    session[:latitude] = params[:latitude]   
    session[:longitude] = params[:longitude]
    render :nothing => true
  end

end
