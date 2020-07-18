class CommunitiesController < ApplicationController
  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to root_path
    else
      render :new
    end
  end

  def community_params
    params.require(:community).permit(:name, :owner, :avatar, :introduction, :shop_id)
  end
end
