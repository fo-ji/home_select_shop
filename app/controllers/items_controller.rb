class ItemsController < ApplicationController
  def new
    @item = Item.new
    # @images = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain, :size, :postage, :shipping_date, :gender, :shop_id, :category_id, :brand_id, images_attributes: [:item_image, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
