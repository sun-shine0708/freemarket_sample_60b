class CreditcardsController < ApplicationController
  require "payjp"

  def new
    card = Creditcard.where(user_id: current_user.id)
    gon.payjp_key = ENV["PAYJP_KEY"]
    redirect_to action: "show" if card.exists?
  end
  
  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @creditcard = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @creditcard.save
        redirect_to action: "show"
      else
        redirect_to action: "new"
      end
    end
  end

  # def buy #購入完了画面をここで実装
  #   if card.blank?
  #     redirect_to action: "new"
  #   else
  #     @product = Product.find(params[:product_id]) #購入する商品情報の取得
  #     card = Creditcard.where(user_id: current_user.id).first
  #     Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #     Payjp::Charge.create(
  #     amount: @product.price,
  #     customer: card.customer_id,
  #     currency: 'jpy'
  #     )
  #     # 購入後の商品在庫数等の変動処理
  #     # if @product.update(status: 1, buyer_id: current_user.id)
  #     #   redirect_to controller: "products", action: 'show'
  #     # else
  #     #   redirect_to controller: "products", action: 'show'
  #     # end
  #   end
  # end

  # 商品詳細ページでネスト
  # def onetimebuy
  #   Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
  #   charge = Payjp::Charge.create(
  #   amount: @product.price,
  #   card: params['payjp-token'],
  #   currency: 'jpy'
  #   )
  # end

  # 購入ボタンview
  # - if current_user.creditcard.present?
  #   = link_to buyアクションへ
  # - else
  #   = form_tag(action: :onetimebuy, method: :post) do
  #     %script.payjp-button{src: "https://checkout.pay.jp", type: "text/javascript", "data-text": "購入する" ,"data-key": "#{ENV["PAYJP_KEY"]}"}

  def show
    card = Creditcard.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @customer_card = customer.cards.retrieve(card.card_id)
    end
  end

  def delete
    card = Creditcard.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "show"
  end
end
