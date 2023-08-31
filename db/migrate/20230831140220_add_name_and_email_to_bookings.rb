class AddNameAndEmailToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :name, :string
    add_column :bookings, :email, :string
  end
end
