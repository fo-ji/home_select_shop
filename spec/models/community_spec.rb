require 'rails_helper'

RSpec.describe Community, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      community = build(:community)
      expect(community).to be_valid
    end
    it "nameが空ならNG" do
      community = build(:community, name: nil)
      community.valid?
      expect(community.errors[:name]).to include("を入力してください")
    end
    it "nameが重複していたらNG" do
      community1 = create(:community)
      expect(build(:community, name: community1.name)).to_not be_valid
    end
    it "ownerが空ならNG" do
      community = build(:community, owner: nil)
      community.valid?
      expect(community.errors[:owner]).to include("を入力してください")
    end
    it "ownerが重複していたらNG" do
      community1 = create(:community)
      expect(build(:community, owner: community1.owner)).to_not be_valid
    end
    it "avatarが空ならNG" do
      community = build(:community, avatar: nil)
      community.valid?
      expect(community.errors[:avatar]).to include("を入力してください")
    end
    it "introductionが空ならNG" do
      community = build(:community, introduction: nil)
      community.valid?
      expect(community.errors[:introduction]).to include("を入力してください")
    end
    it "shop_idが空ならNG" do
      community = build(:community, shop: nil)
      community.valid?
      expect(community.errors[:shop]).to include("を入力してください")
    end
    it "全て入力されていればcommunity_userの登録もOK" do
      community = create(:community, :community_user)
      expect(community).to be_valid
    end
  end
end
