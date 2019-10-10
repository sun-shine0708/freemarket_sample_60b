class StreetaddressesController < ApplicationController
  def new
    @streetaddress = Streetaddress.new
    @user = User.find(params[:user_id])
  end

  def create
    @streetaddress = Streetaddress.new(streetaddress_params)
    if @streetaddress.save
      redirect_to products_path
    else
      render '/signups/user1'
    end
  end

  private
  def streetaddress_params
    params.require(:streetaddress).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :post_number,
      :prefectures,
      :city,
      :address,
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id)
  end
end