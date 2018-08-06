class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @boats = Boat.first(3)
  end

  def dashboard_owner
    @boats = Boats.where(owner: current_user)
  end
end
