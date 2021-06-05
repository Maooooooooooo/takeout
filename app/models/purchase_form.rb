class PurchaseForm
  include ActiveModel::Model


  attr_accessor :user_id, :menu_id, :phone_number, :oeder_time_id, :card_id
  with_options presence: true do
    validates :user_id
    validates :menu_id
    validates :oeder_time_id,numericality: { other_than: 1}
    validates :phone_number,format: { with: /\A\d{10,11}\z/ }
    validates :card_id
  end


  def save
    purchase = Purchase.create(user_id: user_id,menu_id: menu_id,card_id: card_id)
    Pay.create(purchase_id: purchase.id,oeder_time_id: oeder_time_id,phone_number: phone_number)
  end
end