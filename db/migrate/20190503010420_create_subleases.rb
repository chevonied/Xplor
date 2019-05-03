class CreateSubleases < ActiveRecord::Migration
  def change
    create_table :subleases do |t|
      t.string :s_title
      t.text :s_description
      t.integer :s_num_occupants
      t.string :s_address
      t.string :s_state
      t.string :s_city
      t.string :s_zip
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
