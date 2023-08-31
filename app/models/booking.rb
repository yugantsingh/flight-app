class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flight

  before_create :generate_pnr_number

  private

  def generate_pnr_number
    self.pnr_number = SecureRandom.hex(5)
  end

  def booking_params
  params.require(:booking).permit(:flight_id, :seat_class, :seat_number, :name, :email, :pnr_number)
  end

end
