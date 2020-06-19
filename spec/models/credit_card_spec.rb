require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      product = build(:credit_card)
      expect(product).to be_valid
    end
    it "card_numberが空ならNG" do
      product = build(:credit_card, card_number: nil)
      product.valid?
      expect(product.errors[:card_number]).to include("を入力してください")
    end
    it "card_numberが全角ならNG" do
      product = build(:credit_card, card_number: "１１１１１１１１１１１１１１１１")
      product.valid?
      expect(product.errors[:card_number]).to include("は数値で入力してください")
    end
    it "card_numberが16文字以外ならNG" do
      product = build(:credit_card, card_number: "111111111111111")
      product.valid?
      expect(product.errors[:card_number]).to include("は16文字で入力してください")
    end
    it "card_companyが空ならNG" do
      product = build(:credit_card, card_company: nil)
      product.valid?
      expect(product.errors[:card_company]).to include("を入力してください")
    end
    it "card_yearが空ならNG" do
      product = build(:credit_card, card_year: nil)
      product.valid?
      expect(product.errors[:card_year]).to include("を入力してください")
    end
    it "card_monthが空ならNG" do
      product = build(:credit_card, card_month: nil)
      product.valid?
      expect(product.errors[:card_month]).to include("を入力してください")
    end
    it "card_passが空ならNG" do
      product = build(:credit_card, card_pass: nil)
      product.valid?
      expect(product.errors[:card_pass]).to include("を入力してください")
    end
    it "card_passが3桁未満ならNG" do
      product = build(:credit_card, card_pass: "11")
      product.valid?
      expect(product.errors[:card_pass]).to include("は3文字以上で入力してください")
    end
    it "card_passが5桁以上ならNG" do
      product = build(:credit_card, card_pass: "11111")
      product.valid?
      expect(product.errors[:card_pass]).to include("は4文字以内で入力してください")
    end
    it "card_passが全角ならNG" do
      product = build(:credit_card, card_pass: "１１１")
      product.valid?
      expect(product.errors[:card_pass]).to include("は数値で入力してください")
    end
  end
end
