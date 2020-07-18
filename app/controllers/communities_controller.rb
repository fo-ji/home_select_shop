class CommunitiesController < ApplicationController
  before_action :set_community, only: [:edit, :update, :leave, :destroy]

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

  def leave
    @shop = @community.shop
  end

  def destroy
    respond_to do |format|
      if @community.destroy
        format.html { redirect_to root_path, notice: "削除が完了しました" }
      else
        format.html { redirect_to leave_shop_community(@shop.id, @shop.community.id), alert: "削除し失敗しました" }
      end
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
