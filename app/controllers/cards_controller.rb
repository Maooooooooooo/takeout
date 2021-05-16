class CardsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]

  def index
  end

  def new
    @card = Card.where(user_id: current_user.id)
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer = Payjp::Customer.create(
    description: 'test', 
    card: params[:card_token] 
    )

  card = Card.new( # トークン化されたカード情報を保存する
      card_token: params[:card_token], # カードトークン
      customer_token: customer.id, # 顧客トークン
      user_id: current_user.id # ログインしているユーザー
    )
    if card.save
      render:save_card
    else
      redirect_to action: "new" # カード登録画面
    end
  end  

  private
  def cards_params
    params.require(:card).permit(:customer_token,:card_token).merge(user_id:current_user.id)
  end
end
