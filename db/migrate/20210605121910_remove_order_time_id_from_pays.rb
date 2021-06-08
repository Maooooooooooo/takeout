class RemoveOrderTimeIdFromPays < ActiveRecord::Migration[6.0]
  def change
    remove_column :pays, :order_time_id, :integer
  end
end
