class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @review = Review.new
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

    possible_booking = true
    @booking.boat.bookings.each do |booking|
      if (@booking.start_date > booking.start_date) && (@booking.start_date < booking.end_date) || (@booking.end_date > booking.start_date) && (@booking.end_date < booking.end_date)
        possible_booking = false
      end
    end
    if @booking.boat.price != nil
      @booking.total_price = @booking.boat.price * (@booking.end_date - @booking.start_date)
    end
    @booking.status = true
    authorize @booking
    if possible_booking
      @booking.save!
      if @booking.save
        redirect_to dashboard_path
      else
        render :new
      end
    end

end



def update
  @booking.update(booking_params)

  authorize @booking

  if @booking.update(booking_params)
    redirect_to booking_path(@booking)
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
