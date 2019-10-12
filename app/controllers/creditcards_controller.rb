class CreditcardsController < ApplicationController
  require "payjp"

  def new
    card = Creditcard.where(user_id: current_user.id)
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
      else
        redirect_to action: "new"
      end
    end
  end
  
  def delete #Payjp,Cardデータベース削除
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show
    card = Creditcard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
