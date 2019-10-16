require 'rails_helper'

describe ProductsController do
  let(:user) { create(:user) }

  describe 'PATCH #update' do
    let(:params) { { category_id: category.id, user_id: user.id, product: attributes_for(:product) } }

    context 'log in' do
      before do
        login user
      end

      context 'can save' do
        subject {
          patch :update,
          params: params
        }

        it 'count up product' do
          expect{ subject }.to change(Product, :count).by(1)
        end

        it 'redirects to products_path' do
          subject
          expect(response).to redirect_to(products_path)
        end
      end

      context 'can not save' do
        let(:invalid_params) { { category_id: category.id, user_id: user.id, product: attributes_for(:product, name: nil, price: nil) } }

        subject {
          patch :update,
          params: invalid_params
        }

        it 'does not count up' do
          expect{ subject }.not_to change(Product, :count)
        end

        it 'renders index' do
          subject
          expect(response).to render_template :index
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
end