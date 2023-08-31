class AddPnrNumberToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :pnr_number, :string
  end
end
