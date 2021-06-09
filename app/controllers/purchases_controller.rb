class PurchasesController < ApplicationController

  def index
    @purchase = Menu.find(params[:menu_id])
    @purchase_form = PurchaseForm.new
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
    # カスタマー情報からカードの情報を引き出す
    @customer_card = customer.cards.retrieve(@card.id)
    @card_brand = @customer_card.brand
    case @card_brand
    when "Visa"
      # 例えば、Pay.jpからとってきたカード情報の、ブランドが"Visa"だった場合は返り値として
      # (画像として登録されている)card-visa.pngを返す
      @card_src = "card-visa.gif"
    when "JCB"
      @card_src = "card-jcb.gif"
    when "MasterCard"
      @card_src = "card-mastercard.png"
    when "American Express"
      @card_src = "card-amex.gif"
    end
  end


  def create
    redirect_to new_card_path and return unless card.present?
    @purchase = Menu.find(params[:menu_id])
    @purchase_form = PurchaseForm.new(set_params)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @purchase.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
    @purchase_form.save
    redirect_to root_path
  end


  private
  def set_params
    params.require(:purchase_form).permit(:phone_number).merge(user_id:current_user.id,menu_id:params[:menu_id],token:params[:token])
  end
end
