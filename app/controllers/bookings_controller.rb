class BookingsController < ApplicationController
  before_action :set_flight
  before_action :authenticate_user! # Assuming you want users to be authenticated

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flight = @flight
    if @booking.save
      redirect_to flights_path(@flight), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # Other actions like edit, update, destroy
  # ...

  private

  def set_flight
    @flight = Flight.find(params[:flight_id])
  end

  def booking_params
    params.require(:booking).permit(:name, :email, :seat_class, :pnr_number, :flight_id)
  end


end
