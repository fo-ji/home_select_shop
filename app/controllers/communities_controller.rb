class CommunitiesController < ApplicationController
  before_action :set_community, only: [:edit, :update]

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

  def edit
  end

  def update
    if @community.update(community_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :owner, :avatar, :introduction, :shop_id)
  end

  def set_community
    @community = Community.find(params[:id])
  end
end
