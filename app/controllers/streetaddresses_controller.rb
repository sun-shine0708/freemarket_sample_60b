class StreetaddressesController < ApplicationController
  def new
    @streetaddress = Streetaddress.new
  end

  def create
    @streetaddress = Streetaddress.new(streetaddress_params)
    if @streetaddress.save
      redirect_to new_creditcard_path
    else
      redirect_to new_streetaddress_path
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
      :prefecture,
      :city,
      :address,
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id)
  end
end