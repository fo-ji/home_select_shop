class Api::TalksController < ApplicationController
  def index
    community = Community.find(params[:community_id])
    last_talk_id = params[:id].to_i
    @talks = community.talks.includes(:user).where("id > #{last_talk_id}")
  end
end
