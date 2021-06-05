class CreatePays < ActiveRecord::Migration[6.0]
  def change
    create_table :pays do |t|
      t.references :purchase, foreign_key: true
      t.string :phone_number,null: false
      t.integer :order_time_id,null: false
      t.timestamps
    end
  end
end
