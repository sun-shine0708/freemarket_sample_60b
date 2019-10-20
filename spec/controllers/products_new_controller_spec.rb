#商品出品コントローラーテスト

# require 'rails_helper'

# describe ProductsController do
#   let(:user) { create(:user) }

#   describe 'GET #new' do
#     it "renders the :new template" do
#       get :new
#       expect(response).to render_template :new
#     end
#   end


#   describe '#create' do
#     let(:params) { {user_id: user.id, product: attributes_for(:product) } }

#     context 'log in' do
#       before do
#       end
      
#       context 'can save' do
#         subject {
#           post :create,
#           params: params
#         }

#         it 'count up product' do
#           expect{ subject }.to change(Product, :count).by(1)
#         end
        
#         it 'redirects to index' do
#           subject
#           expect(response).to render_template :index
#         end
#       end

#       context 'can not save' do
#         let(:invalid_params) { { product: attributes_for(:product, name: nil, price: nil) } }

#         subject {
#           post :create,
#           params: invalid_params
#         }

#         it 'does not count up' do
#           expect{ subject }.not_to change(Product, :count)
#         end

#         it 'renders new' do
#           subject
#           expect(response).to render_template :new
#         end
#       end
#     end
#   end
# end