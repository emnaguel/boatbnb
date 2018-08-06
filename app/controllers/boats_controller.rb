class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def new
    @boat = Boat.new
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.owner = current_user
    @boat.save!
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :address, :description, :stars, :model, :price)
  end
end
