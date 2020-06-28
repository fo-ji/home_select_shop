require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      shop = build(:shop)
      expect(shop).to be_valid
    end
    it "nameが空ならNG" do
      shop = build(:shop, name: nil)
      shop.valid?
      expect(shop.errors[:name]).to include("を入力してください")
    end
    it "nameが重複していたらNG" do
      shop1 = create(:shop)
      expect(build(:shop, name: shop1.name)).to_not be_valid
    end
    it "emailが空ならNG" do
      shop = build(:shop, email: nil)
      shop.valid?
      expect(shop.errors[:email]).to include("を入力してください")
    end
    it "emailが意図しない形ならNG" do
      shop = build(:shop, email: "aaagmail.com")
      shop.valid?
      expect(shop.errors[:email]).to include("は不正な値です")
    end
    it "emailが重複していたらNG" do
      shop1 = create(:shop)
      expect(build(:shop, email: shop1.email)).to_not be_valid
    end
    it "postal_codeが空ならNG" do
      shop = build(:shop, postal_code: nil)
      shop.valid?
      expect(shop.errors[:postal_code]).to include("を入力してください")
    end
    it "postal_codeが意図しない形ならNG（全角）" do
      shop = build(:shop, postal_code: "１１１ー１１１１")
      shop.valid?
      expect(shop.errors[:postal_code]).to include("は不正な値です")
    end
    it "postal_codeが意図しない形ならNG（ハイフンなし）" do
      shop = build(:shop, postal_code: "1111111")
      shop.valid?
      expect(shop.errors[:postal_code]).to include("は不正な値です")
    end
    it "prefectureが空ならNG" do
      shop = build(:shop, prefecture: nil)
      shop.valid?
      expect(shop.errors[:prefecture]).to include("を入力してください")
    end
    it "cityが空ならNG" do
      shop = build(:shop, city: nil)
      shop.valid?
      expect(shop.errors[:city]).to include("を入力してください")
    end
    it "addressが空ならNG" do
      shop = build(:shop, address: nil)
      shop.valid?
      expect(shop.errors[:address]).to include("を入力してください")
    end
    it "phone_numberが意図しない形ならNG（全角）" do
      shop = build(:shop, phone_number: "１１１１１１１１１１１")
      shop.valid?
      expect(shop.errors[:phone_number]).to include("は不正な値です")
    end
    it "全て入力されていればstylistの登録もOK" do
      shop = create(:shop, :stylist)
      expect(shop).to be_valid
    end
  end
end
