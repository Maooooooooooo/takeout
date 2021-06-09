class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.references :user, foreign_key: true
      t.string :restaurant_name,null: false
      t.integer :area_id,null: false
      t.integer :genre_id,null: false
      t.string :opening_hours,null: false
      t.string :address,null: false
      t.string :phone_number,null: false
      t.timestamps
    end
  end
end
