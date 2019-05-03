class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :r_title
      t.text :r_description
      t.integer :r_num_occupants
      t.string :r_address
      t.string :r_state
      t.string :r_city
      t.string :r_zip
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
