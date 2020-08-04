require 'rails_helper'

RSpec.describe Coordinate, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      coordinate= create(:coordinate)
      expect(coordinate).to be_valid
    end
    it "nameが空ならNG" do
      coordinate= build(:coordinate, name: nil)
      coordinate.valid?
      expect(coordinate.errors[:name]).to include("を入力してください")
    end
    it "nameが重複していたらNG" do
      coordinate1 = create(:coordinate)
      expect(build(:coordinate, name: coordinate1.name)).to_not be_valid
    end
    it "total_priceが空ならNG" do
      coordinate= build(:coordinate, total_price: nil)
      coordinate.valid?
      expect(coordinate.errors[:total_price]).to include("を入力してください")
    end
    it "total_priceがinteger以外ならNG" do
      coordinate= build(:coordinate, total_price: "１３００")
      coordinate.valid?
      expect(coordinate.errors[:total_price]).to include("は数値で入力してください")
    end
    it "total_priceが100円未満ならNG" do
      coordinate= build(:coordinate, total_price: "90")
      coordinate.valid?
      expect(coordinate.errors[:total_price]).to include("は100以上の値にしてください")
    end
    it "total_priceが9999999円よりも高額ならNG" do
      coordinate= build(:coordinate, total_price: "19999999")
      coordinate.valid?
      expect(coordinate.errors[:total_price]).to include("は9999999以下の値にしてください")
    end
    it "setが空ならNG" do
      coordinate= build(:coordinate, set: nil)
      coordinate.valid?
      expect(coordinate.errors[:set]).to include("を入力してください")
    end
    it "setが4ケタならNG" do
      coordinate= build(:coordinate, set: "1609")
      coordinate.valid?
      expect(coordinate.errors[:set]).to include("は3文字以内で入力してください")
    end
    it "explainが空ならNG" do
      coordinate= build(:coordinate, explain: nil)
      coordinate.valid?
      expect(coordinate.errors[:explain]).to include("を入力してください")
    end
    it "postageが空ならNG" do
      coordinate= build(:coordinate, postage: nil)
      coordinate.valid?
      expect(coordinate.errors[:postage]).to include("を入力してください")
    end
    it "shipping_dateが空ならNG" do
      coordinate= build(:coordinate, shipping_date: nil)
      coordinate.valid?
      expect(coordinate.errors[:shipping_date]).to include("を入力してください")
    end
    it "genderが空ならNG" do
      coordinate= build(:coordinate, gender: nil)
      coordinate.valid?
      expect(coordinate.errors[:gender]).to include("を入力してください")
    end
    it "user_idが空ならNG" do
      coordinate= build(:coordinate, user: nil)
      coordinate.valid?
      expect(coordinate.errors[:user]).to include("を入力してください")
    end
    it "shop_idが空ならNG" do
      coordinate= build(:coordinate, shop: nil)
      coordinate.valid?
      expect(coordinate.errors[:shop]).to include("を入力してください")
    end
  end
end
