class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_community, only: [:edit, :update, :show, :join, :leave, :destroy]
  before_action :set_shop, only: [:new, :edit, :leave]

  def index
    @communities = Community.all.limit(20).order(created_at: "DESC")
  end

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

  def show
  end

  def join
    @community.users << current_user
    respond_to do |format|
      if @community.save
        format.html { render :show, notice: "コミュニティに参加しました" }
      else
        format.html { render :show, alert: "エラーが発生しました" }
      end
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

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
