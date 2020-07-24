class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action      :set_shop, only: [:admin_index, :show, :edit, :admin, :update, :destroy, :leave]
  before_action      :set_admin_stylist, only: [:admin_index, :edit, :update, :leave, :destroy, :admin]

  def admin_index
    @items = @shop.items.includes(:images).all.order(created_at: "DESC")
  end

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
  end

  def update
    if @shop.update(shop_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy 
    if @shop.destroy
      redirect_to root_path
    else
      render :admin
    end
  end

  def admin
  end

  def leave
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :avatar, :introduction, :postal_code, :prefecture, :city, :address, :apartment, :phone_number, :official_site, :facebook_account, :line_account, :instagram_account, user_ids: [])
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def set_admin_stylist
    unless @shop.users.include?(current_user)
      redirect_to root_path
    end
  end
end
