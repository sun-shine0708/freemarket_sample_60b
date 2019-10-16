require 'rails_helper'

describe ProductsController do

  describe 'GET #edit' do
    let(:product) { FactoryBot.create :product }

    it 'リクエストが成功すること' do
      get :edit, params: { id: product }
      expect(response.status).to eq 200
    end

    it 'editテンプレートで表示されること' do
      get :edit, params: { id: product }
      expect(response).to render_template :edit
    end

    it '@productが取得できていること' do
      get :show, params: { id: product }
      expect(assigns :product).to eq product
    end
  end

  describe 'PATCH #update' do
    let(:params) { {seller_id: seller.id, product: attributes_for(:product) } }

    context 'log in' do
      before do
        login user
      end

      context 'can update' do
        subject {
          patch :update,
          params: params
        }

        it 'update product' do
          expect{ subject }.to eq product
        end

        it 'redirects to products_path' do
          subject
          expect(response).to redirect_to(products_path)
        end
      end

      context 'can not save' do
        let(:invalid_params) { { category_id: category.id, seller_id: seller.id, product: attributes_for(:product, name: nil, price: nil) } }

        subject {
          patch :update,
          params: invalid_params
        }

        it 'does not update' do
          expect{ subject }.not_to eq product
        end

        it 'renders index' do
          subject
          expect(response).to render_template :edit
        end
      end
    end

    context 'not log in' do

      it 'redirects to new_user_session_path' do
        patch :update, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'delete #destroy' do
    it "deletes the product" do
      product = create(:product)
      expect{
        delete :destroy, id: product
      }.to change(Product,:count).by(-1)
    end
  end

  describe 'GET #show' do
    context '商品が存在する場合' do
      let(:product) { FactoryBot.create :product }
      it 'リクエストが成功すること' do
        product = create(:product)
        get :show, params: { id: product }
        expect(response.status).to eq 200
      end

      it 'showテンプレートで表示されること' do
        get :show, params: { id: product }
        expect(response).to render_template :show
      end

      it '@productが取得できていること' do
        get :show, params: { id: product }
        expect(assigns :product).to eq product
      end
    end

    context '商品が存在しない場合' do
      subject { -> { get :show, params: { id: 1 } } }

      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end
end