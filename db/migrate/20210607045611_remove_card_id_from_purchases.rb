class RemoveCardIdFromPurchases < ActiveRecord::Migration[6.0]
  def change
    remove_column :purchases, :card_id, :integer
  end
end
