class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @boats = Boat.first(3)
    @boats = Boat.where.not(latitude: nil, longitude: nil)

    @markers = @boats.map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def dashboard
    @boats = Boat.where(owner: current_user)
    @bookings_as_owner = Booking.where(owner: current_user.id)
    @bookings_as_renter = Booking.where(user: current_user)
  end
end
