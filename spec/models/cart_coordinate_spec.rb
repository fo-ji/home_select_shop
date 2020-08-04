require 'rails_helper'

RSpec.describe CartCoordinate, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      cart_coordinate = build(:cart_coordinate)
      expect(cart_coordinate).to be_valid
    end
    it "coordinate_idが空ならNG" do
      cart_coordinate = build(:cart_coordinate, coordinate: nil)
      cart_coordinate.valid?
      expect(cart_coordinate.errors[:coordinate]).to include("を入力してください")
    end
    it "cart_idが空ならNG" do
      cart_coordinate = build(:cart_coordinate, cart: nil)
      cart_coordinate.valid?
      expect(cart_coordinate.errors[:cart]).to include("を入力してください")
    end
  end
end
