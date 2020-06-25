class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

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

  def show
    @shop = Shop.find(params[:id])
    # ページネーションの設定（商品出品ができてから実装）
    # @shop_items = Shop.items.page(params[:page]).per(20)
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :avatar, :introduction, :postal_code, :prefecture, :city, :address, :apartment, :phone_number, user_ids: [])
  end
end
