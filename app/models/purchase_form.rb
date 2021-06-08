class PurchaseForm
  include ActiveModel::Model


  attr_accessor :user_id, :menu_id, :phone_number,:token
  with_options presence: true do
    validates :user_id
    validates :menu_id
    validates :phone_number,format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/ }
    validates :token
  end


  def save
    purchase = Purchase.create(user_id: user_id,menu_id: menu_id)
    Pay.create(purchase_id: purchase.id,phone_number: phone_number)
  end
end