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
      # (画像として登録されている)Visa.pngを返す
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
    customer_card = customer.cards.retrieve(card.card_token)
    ##カードのアイコン表示のための定義づけ
    @card = customer.cards.first
    
    @card_brand = @customer_card.brand
    case @card_brand
    when "Visa"
      # 例えば、Pay.jpからとってきたカード情報の、ブランドが"Visa"だった場合は返り値として
      # (画像として登録されている)Visa.pngを返す
      @card_src = "card-visa.gif"
    when "JCB"
      @card_src = "card-jcb.gif"
    when "MasterCard"
      @card_src = "card-mastercard.png"
    when "American Express"
      @card_src = "card-amex.gif"
    end
    # viewの記述を簡略化
    ## 有効期限'月'を定義
    @exp_month = @customer_card.exp_month.to_s
    ## 有効期限'年'を定義
    @exp_year = @customer_card.exp_year.to_s.slice(2,3)
  end


  private
  def set_params
    params.require(:purchase_form).permit(:phone_number, :order_time_id).merge(user_id:current_user.id,card_id:params[:card_id],menu_id:params[:menu_id])
  end
end
