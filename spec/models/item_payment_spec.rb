require 'rails_helper'

RSpec.describe ItemPayment, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      item_payment = build(:item_payment)
      expect(item_payment).to be_valid
    end
    it "purchase_amountが空ならNG" do
      item_payment = build(:item_payment, purchase_amount: nil)
      item_payment.valid?
      expect(item_payment.errors[:purchase_amount]).to include("を入力してください")
    end
    it "purchase_amountがinteger以外ならNG" do
      item_payment = build(:item_payment, purchase_amount: "１３")
      item_payment.valid?
      expect(item_payment.errors[:purchase_amount]).to include("は数値で入力してください")
    end
    it "charge_idが空でもOK" do
      item_payment = build(:item_payment, charge_id: nil)
      expect(item_payment).to be_valid
    end
    it "user_idが空ならNG" do
      item_payment = build(:item_payment, user: nil)
      item_payment.valid?
      expect(item_payment.errors[:user]).to include("を入力してください")
    end
    it "item_idが空ならNG" do
      item_payment = build(:item_payment, item: nil)
      allow(item_payment).to receive(:validate_purchase_amount_for_stock).and_return(true)
      item_payment.valid?
      expect(item_payment.errors[:item]).to include("を入力してください")
    end
    it "stockよりpurchase_amountが多い場合は購入できない" do
      item_payment = build(:item_payment, purchase_amount: "20")
      item_payment.valid?
      expect(item_payment.errors[:purchase_amount]).to include("購入できるのは10個までです")
    end
  end
end
