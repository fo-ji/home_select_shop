class CartsController < ApplicationController
  before_action :setup_cart_item!,       except: [:show]
  before_action :setup_cart_coordinate!, except: [:show]

  def show
    @cart_items = current_cart.cart_items
    @cart_coordinates = current_cart.cart_coordinates
    @numbers = [*(1..5)]
  end

  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(item_id: params[:item_id])
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def add_coordinate
    if @cart_coordinate.blank?
      @cart_coordinate = current_cart.cart_coordinates.build(coordinate_id: params[:coordinate_id])
    end

    @cart_coordinate.quantity += params[:quantity].to_i
    @cart_coordinate.save
    redirect_to current_cart
  end

  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def update_coordinate
    @cart_coordinate.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

  def delete_coordinate
    @cart_coordinate.destroy
    redirect_to current_cart
  end

  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

  def setup_cart_coordinate!
    @cart_coordinate = current_cart.cart_coordinates.find_by(coordinate_id: params[:coordinate_id])
  end
end
