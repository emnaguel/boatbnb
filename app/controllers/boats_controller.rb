class BoatsController < ApplicationController
  def index
    @boats = policy_scope(Boat)

  end


  def show
    @boat = Boat.find(params[:id])


   @marker = [{
      lat: @boat.latitude,
      lng: @boat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }] if (@boat.latitude.present? && @boat.longitude.present?)

    @bookings = []
    num_bookings = 0
    @boat.bookings.each do |booking|
      @bookings << [booking.start_date, booking.end_date]
      num_bookings += 1
    end

    @booking = Booking.new
    authorize @boat

  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.owner = current_user
    @boat.save!
    authorize @boat
    redirect_to boat_path(@boat)
  end

  def edit
     @boat = Boat.find(params[:id])
     authorize @boat
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    authorize @boat
    if @boat.update(boat_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
      @boat = Boat.find(params[:id])
      authorize @boat
      @boat.destroy
      redirect_to dashboard_path
  end


  private

  def boat_params
    params.require(:boat).permit(:name, :address, :description, :stars, :model, :price, :user_id, :photo)
  end
end
