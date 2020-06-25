class ShopsController < ApplicationController
  def new
    @shop = Shop.new
    @shop.users << current_user
  end
  
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :avatar, :introduction, :postal_code, :prefecture, :city, :address, :apartment, :phone_number, user_ids: [])
  end
end
