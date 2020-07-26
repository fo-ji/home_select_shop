class CoordinatesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_coordinate, only: [:show]
  before_action :set_shop_gretel, only: [:new]

  def new
    @coordinate = Coordinate.new
    @shop_items = @shop.items.includes(:images)
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

  def set_shop_gretel
    @shop = Shop.find(params[:shop_id])
  end
end
