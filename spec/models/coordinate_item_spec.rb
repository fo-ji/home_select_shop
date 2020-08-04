require 'rails_helper'

RSpec.describe CoordinateItem, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      coordinate_item = build(:coordinate_item)
      expect(coordinate_item).to be_valid
    end
    it "coordinate_idが空ならNG" do
      coordinate_item = build(:coordinate_item, coordinate: nil)
      coordinate_item.valid?
      expect(coordinate_item.errors[:coordinate]).to include("を入力してください")
    end
    it "item_idが空ならNG" do
      coordinate_item = build(:coordinate_item, item: nil)
      coordinate_item.valid?
      expect(coordinate_item.errors[:item]).to include("を入力してください")
    end
  end
end
