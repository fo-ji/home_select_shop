require 'rails_helper'

RSpec.describe CommunityUser, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      community_user = build(:community_user)
      expect(community_user).to be_valid
    end
    it "community_idが空ならNG" do
      community_user = build(:community_user, community: nil)
      community_user.valid?
      expect(community_user.errors[:community]).to include("を入力してください")
    end
    it "user_idが空ならNG" do
      community_user = build(:community_user, user: nil)
      community_user.valid?
      expect(community_user.errors[:user]).to include("を入力してください")
    end
  end
end
