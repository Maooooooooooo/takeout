class AddCardIdToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_reference :purchases, :card, null: false, foreign_key: true
  end
end
