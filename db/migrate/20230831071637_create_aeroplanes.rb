class CreateAeroplanes < ActiveRecord::Migration[7.0]
  def change
    create_table :aeroplanes do |t|
      t.string :plane
      t.integer :first_class_columns
      t.integer :first_class_rows
      t.integer :business_class_columns
      t.integer :business_class_rows
      t.integer :economy_class_columns
      t.integer :economy_class_rows
      t.string :model
      t.integer :seats

      t.timestamps
    end
  end
end
