require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      item = create(:item)
      expect(item).to be_valid
    end
    it "nameが空ならNG" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    it "priceが空ならNG" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    it "priceがinteger以外ならNG" do
      item = build(:item, price: "１３００")
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end
    it "priceが100円未満ならNG" do
      item = build(:item, price: "90")
      item.valid?
      expect(item.errors[:price]).to include("は100以上の値にしてください")
    end
    it "priceが9999999円よりも高額ならNG" do
      item = build(:item, price: "19999999")
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end
    it "explainが空ならNG" do
      item = build(:item, explain: nil)
      item.valid?
      expect(item.errors[:explain]).to include("を入力してください")
    end
    it "sizeが空ならNG" do
      item = build(:item, size: nil)
      item.valid?
      expect(item.errors[:size]).to include("を入力してください")
    end
    it "postageが空ならNG" do
      item = build(:item, postage: nil)
      item.valid?
      expect(item.errors[:postage]).to include("を入力してください")
    end
    it "shipping_dateが空ならNG" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("を入力してください")
    end
    it "genderが空ならNG" do
      item = build(:item, gender: nil)
      item.valid?
      expect(item.errors[:gender]).to include("を入力してください")
    end
    it "user_idが空ならNG" do
      item = build(:item, user: nil)
      item.valid?
      expect(item.errors[:user]).to include("を入力してください")
    end
    it "shop_idが空ならNG" do
      item = build(:item, shop: nil)
      item.valid?
      expect(item.errors[:shop]).to include("を入力してください")
    end
    it "brand_idが空ならNG" do
      item = build(:item, brand: nil)
      item.valid?
      expect(item.errors[:brand]).to include("を入力してください")
    end
    it "category_idが空ならNG" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end
  end
end
