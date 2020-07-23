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
    it "avatarが空でもOK" do
      shop = build(:shop, avatar: nil)
      expect(shop).to be_valid
    end
    it "introductionが空でもOK" do
      shop = build(:shop, introduction: nil)
      expect(shop).to be_valid
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
    it "apartmentが空でもOK" do
      shop = build(:shop, apartment: nil)
      expect(shop).to be_valid
    end
    it "phone_numberが意図しない形ならNG（全角）" do
      shop = build(:shop, phone_number: "１１１１１１１１１１１")
      shop.valid?
      expect(shop.errors[:phone_number]).to include("は不正な値です")
    end
    it "official_siteが空でもOK" do
      shop = build(:shop, official_site: nil)
      expect(shop).to be_valid
    end
    it "official_siteが意図しない形ならNG" do
      shop = build(:shop, official_site: "h.com")
      shop.valid?
      expect(shop.errors[:official_site]).to include("は不正な値です")
    end
    it "facebook_accountが空でもOK" do
      shop = build(:shop, facebook_account: nil)
      expect(shop).to be_valid
    end
    it "facebook_accountが意図しない形ならNG" do
      shop = build(:shop, facebook_account: "h.com")
      shop.valid?
      expect(shop.errors[:facebook_account]).to include("は不正な値です")
    end
    it "line_accountが空でもOK" do
      shop = build(:shop, line_account: nil)
      expect(shop).to be_valid
    end
    it "line_accountが意図しない形ならNG" do
      shop = build(:shop, line_account: "h.com")
      shop.valid?
      expect(shop.errors[:line_account]).to include("は不正な値です")
    end
    it "instagram_accountが空でもOK" do
      shop = build(:shop, instagram_account: nil)
      expect(shop).to be_valid
    end
    it "instagram_accountが意図しない形ならNG" do
      shop = build(:shop, instagram_account: "h.com")
      shop.valid?
      expect(shop.errors[:instagram_account]).to include("は不正な値です")
    end
    it "全て入力されていればstylistの登録もOK" do
      shop = create(:shop, :stylist)
      expect(shop).to be_valid
    end
  end
end
