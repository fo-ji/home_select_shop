class CoordinatesController < ApplicationController
  # before_action :set_shop, only: [:new]

  def new
    @coordinate = Coordinate.new
  end

  def create
    @coordinate = Coordinate.new(coodinate_params)
    if @coordinate.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # def set_shop
  #   @shop = Shop.find(parmas[:id])
  # end

  def coordinate_params
    params.require(:coordinate).permit(:name, :explain, :total_price, :postage, :shipping_date, :gender, :set, item_ids: [])
  end
end
