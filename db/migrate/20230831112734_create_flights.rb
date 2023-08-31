class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.datetime :departure
      t.datetime :arrival
      t.float :fcfare
      t.float :bcfare
      t.float :ecfare
      t.references :aeroplane, null: false, foreign_key: true

      t.timestamps
    end
  end
end
