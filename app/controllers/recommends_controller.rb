class RecommendsController < ApplicationController
  before_action :set_community

  def index
    @recommends = @community.recommends.includes(:user)
  end

  def new
    @recommend = Recommend.new
  end

  def create
    @recommend = Recommend.new(recommend_params)
    if @recommend.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def recommend_params
    params.require(:recommend).permit(:name, :image, :genre, :introduction, :url, :community_id).merge(user_id: current_user.id)
  end

  def set_community
    @community = Community.find(params[:community_id])
  end
end
