class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :top

  def top
    @parents = Category.where(ancestry: nil)
  end
end
