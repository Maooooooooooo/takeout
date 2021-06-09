class AddOrderTimeIdToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :order_time_id, :integer
  end
end
