class Api::UsersController < ApplicationController
  respond_to :json

  def update
    session[:latitude] = params[:latitude].to_f
    session[:longitude] = params[:longitude].to_f
    render :nothing => true
  end

end
