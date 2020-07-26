class CoordinatesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_coordinate, only: [:show, :edit, :update]
  before_action :set_shop, only: [:edit, :update]
  before_action :set_shop_gretel, only: [:new, :edit]
  before_action :set_shop_items, only: [:new, :edit]

  def new
    @coordinate = Coordinate.new
  end

  def create
    @coordinate = Coordinate.new(coordinate_params)
    if @coordinate.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = @coordinate.items.includes(:images)
  end

  def edit
  end

  def update
    if @coordinate.update(coordinate_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_coordinate
    @coordinate = Coordinate.find(params[:id])
  end

  def coordinate_params
    params.require(:coordinate).permit(:name, :explain, :total_price, :postage, :shipping_date, :gender, :set, :image, :shop_id, item_ids: []).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = @coordinate.shop
  end

  def set_shop_gretel
    @shop = Shop.find(params[:shop_id])
  end

  def set_shop_items
    @shop_items = @shop.items.includes(:images)
  end
end
