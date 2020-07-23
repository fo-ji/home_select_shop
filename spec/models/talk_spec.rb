require 'rails_helper'

RSpec.describe Talk, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      talk = build(:talk)
      expect(talk).to be_valid
    end
    it "talkが空でもOK" do
      talk = build(:talk, talk: nil)
      expect(talk).to be_valid
    end
    it "imageが空でもOK" do
      talk = build(:talk, image: nil)
      expect(talk).to be_valid
    end
    it "community_idが空ならNG" do
      talk = build(:talk, community: nil)
      talk.valid?
      expect(talk.errors[:community]).to include("を入力してください")
    end
    it "user_idが空ならNG" do
      talk = build(:talk, user: nil)
      talk.valid?
      expect(talk.errors[:user]).to include("を入力してください")
    end
  end
end
