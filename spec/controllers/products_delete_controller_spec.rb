require 'rails_helper'

describe ProductsController do

  describe 'delete #destroy' do
    let(:seller) { create(:user) }

    context "delete-function" do

      before do
        sign_in seller
      end

      it "deletes the product" do
        category = Category.find(43)
        product = FactoryBot.create(:product, seller: seller, category: category)
        expect{
          delete :destroy, id: product
        }.to change(Product,:count).by(-1)
      end
    end
  end
end