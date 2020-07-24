require 'rails_helper'

RSpec.describe Image, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      image = create(:image)
      expect(image).to be_valid
    end
    it "item_imageが空ならNG" do
      image = build(:image, item_image: nil)
      image.valid?
      expect(image.errors[:item_image]).to include("を入力してください")
    end
    it "item_idが空ならNG" do
      image = build(:image, item: nil)
      image.valid?
      expect(image.errors[:item]).to include("を入力してください")
    end
  end
end
