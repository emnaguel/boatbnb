class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    authorize @booking
  end

  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.boat = Boat.find(params[:boat_id])
    #@booking.total_price = @booking.boat.price * (@booking.end_date - @booking.start_date)
    authorize @booking

    @booking.save!
    if @booking.save
      redirect_to dashboard_path
    else
      render 'boat/show'
    end
  end



  def update
    @booking.update(booking_params)

    authorize @booking

    if @booking.update(booking_params)
      redirect_to dashboard_path(@booking)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    authorize @booking
    redirect_to dashboard_path
  end

private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :status, :user_id, :boat_id)
  end
end
