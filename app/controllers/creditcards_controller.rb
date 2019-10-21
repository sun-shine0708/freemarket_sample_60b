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

  def buy
    card = Creditcard.where(user_id: current_user.id).first
    @product = Product.find(params[:product_id])
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      if Payjp::Charge.create(
        amount: @product.price,
        customer: card.customer_id,
        currency: 'jpy',
        )
        @product.update(buyer_id: current_user.id)
      else
        redirect_to buy_confirmation_product_path
      end
    end
  end

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
