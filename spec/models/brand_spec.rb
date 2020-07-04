require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      brand = create(:brand)
      expect(brand).to be_valid
    end
    it "brandが空ならNG" do
      brand = build(:brand, brand: nil)
      brand.valid?
      expect(brand.errors[:brand]).to include("を入力してください")
    end
  end
end
