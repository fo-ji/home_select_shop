class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action      :set_shop, only: [:show, :edit, :admin]


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
    # ページネーションの設定（商品出品ができてから実装）
    # @shop_items = Shop.items.page(params[:page]).per(20)
  end

  def edit
    @shop.users.each do |admin_user|
      if user_signed_in? && admin_user == current_user
      else
        render :show
      end
    end
  end

  def update
    if @shop.update(shop_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def admin
    @shop.users.each do |admin_user|
      if user_signed_in? && admin_user == current_user
      else
        render :show
      end
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :avatar, :introduction, :postal_code, :prefecture, :city, :address, :apartment, :phone_number, user_ids: [])
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
