require 'rails_helper'

RSpec.describe Recommend, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      recommend = build(:recommend)
      expect(recommend).to be_valid
    end
    it "nameが空ならNG" do
      recommend = build(:recommend, name: nil)
      recommend.valid?
      expect(recommend.errors[:name]).to include("を入力してください")
    end
    it "imageが空ならNG" do
      recommend = build(:recommend, image: nil)
      recommend.valid?
      expect(recommend.errors[:image]).to include("を入力してください")
    end
    it "genreが空ならNG" do
      recommend = build(:recommend, genre: nil)
      recommend.valid?
      expect(recommend.errors[:genre]).to include("を入力してください")
    end
    it "introductionが空ならNG" do
      recommend = build(:recommend, introduction: nil)
      recommend.valid?
      expect(recommend.errors[:introduction]).to include("を入力してください")
    end
    it "urlが空でもOK" do
      recommend = build(:recommend, url: nil)
      expect(recommend).to be_valid
    end
    it "urlが意図しない形ならNG" do
      recommend = build(:recommend, url: "h.com")
      recommend.valid?
      expect(recommend.errors[:url]).to include("は不正な値です")
    end
    it "user_idが空ならNG" do
      recommend = build(:recommend, user: nil)
      recommend.valid?
      expect(recommend.errors[:user]).to include("を入力してください")
    end
    it "community_idが空ならNG" do
      recommend = build(:recommend, community: nil)
      recommend.valid?
      expect(recommend.errors[:community]).to include("を入力してください")
    end
  end
end
