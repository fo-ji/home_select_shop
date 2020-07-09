class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_shop, only: [:edit, :update]

  def new
    @item = Item.new
    @item.build_brand
    @item_images = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    child_category = @item.category

    @category_parent_ary = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_ary << parent
    end

    @category_children_ary = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_ary << children
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search_child
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  def destroy 
    if @item.destroy
      redirect_to admin_index_shop_path
    else
      render :admin
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explain, :size, :postage, :shipping_date, :gender, :stock, :shop_id, :category_id, brand_attributes: [:brand], images_attributes: [:item_image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
