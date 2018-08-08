class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @boats = Boat.first(3)
  end

  def dashboard
    @boats = Boat.where(owner: current_user)
    @bookings_as_owner = Booking.where(owner: current_user.id)
    @bookings_as_renter = Booking.where(user: current_user)
  end
end
