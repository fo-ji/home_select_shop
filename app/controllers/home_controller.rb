class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :top

  def top
    @parents = Category.where(ancestry: nil)
    @all_items = Item.all.limit(10).order(created_at: "DESC")
  end
end
