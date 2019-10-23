require 'rails_helper'

describe CreditcardsController do
  describe 'POST #buy' do
    let(:buyer) { create(:user) }
    let(:seller) { create(:another_user) }
    let(:product) { create(:product, seller: seller) }
    let(:streetaddress) { create(:streetaddress, user: buyer) }
    let(:creditcard) { create(:creditcard, user: buyer) }
    context "buy-function" do

      before do
        sign_in buyer
      end

      it "@productは期待した値になるか？" do
        post :buy, params: { product_id: product }
        expect(assigns(:product)).to eq product
      end

      it "card.blank?==true 正しいビューに変遷する" do
        post :buy, params: { product_id: product }
        expect(response).to redirect_to new_creditcard_path
      end

    end
  end
end