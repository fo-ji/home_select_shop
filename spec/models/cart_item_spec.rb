require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      cart_item = build(:cart_item)
      expect(cart_item).to be_valid
    end
    it "item_idが空ならNG" do
      cart_item = build(:cart_item, item: nil)
      cart_item.valid?
      expect(cart_item.errors[:item]).to include("を入力してください")
    end
    it "cart_idが空ならNG" do
      cart_item = build(:cart_item, cart: nil)
      cart_item.valid?
      expect(cart_item.errors[:cart]).to include("を入力してください")
    end
  end
end
