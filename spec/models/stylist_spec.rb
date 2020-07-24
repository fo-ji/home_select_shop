require 'rails_helper'

RSpec.describe Stylist, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      stylist = build(:stylist)
      expect(stylist).to be_valid
    end
    it "shop_idが空ならNG" do
      stylist = build(:stylist, shop: nil)
      stylist.valid?
      expect(stylist.errors[:shop]).to include("を入力してください")
    end
    it "user_idが空ならNG" do
      stylist = build(:stylist, user: nil)
      stylist.valid?
      expect(stylist.errors[:user]).to include("を入力してください")
    end
  end
end
