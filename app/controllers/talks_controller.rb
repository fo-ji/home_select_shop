class TalksController < ApplicationController
  before_action :set_community

  def index
    @talk = Talk.new
    @talks = @community.talks.includes(:user)
  end

  def create
    @talk = @community.talks.new(talk_params)
    if @talk.save
      respond_to do |format|
        format.html { redirect_to community_talks_path(@community), notice: "トークが送信されました" }
        format.json
      end
    else
      @talks = @community.talks.includes(:user)
      flash.now[:alert] = "トークを入力してください。"
      render :index
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:talk, :image).merge(user_id: current_user.id)
  end

  def set_community
    @community = Community.find(params[:community_id])
  end
end
