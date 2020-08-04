require 'rails_helper'

RSpec.describe CoordinatePayment, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      coordinate_payment = build(:coordinate_payment)
      expect(coordinate_payment).to be_valid
    end
    it "purchase_amountが空ならNG" do
      coordinate_payment = build(:coordinate_payment, purchase_amount: nil)
      coordinate_payment.valid?
      expect(coordinate_payment.errors[:purchase_amount]).to include("を入力してください")
    end
    it "purchase_amountがinteger以外ならNG" do
      coordinate_payment = build(:coordinate_payment, purchase_amount: "１３")
      coordinate_payment.valid?
      expect(coordinate_payment.errors[:purchase_amount]).to include("は数値で入力してください")
    end
    it "charge_idが空でもOK" do
      coordinate_payment = build(:coordinate_payment, charge_id: nil)
      expect(coordinate_payment).to be_valid
    end
    it "user_idが空ならNG" do
      coordinate_payment = build(:coordinate_payment, user: nil)
      coordinate_payment.valid?
      expect(coordinate_payment.errors[:user]).to include("を入力してください")
    end
    it "coordinate_idが空ならNG" do
      coordinate_payment = build(:coordinate_payment, coordinate: nil)
      allow(coordinate_payment).to receive(:validate_purchase_amount_for_set).and_return(true)
      coordinate_payment.valid?
      expect(coordinate_payment.errors[:coordinate]).to include("を入力してください")
    end
    it "setよりpurchase_amountが多い場合は購入できない" do
      coordinate_payment = build(:coordinate_payment, purchase_amount: "20")
      coordinate_payment.valid?
      expect(coordinate_payment.errors[:purchase_amount]).to include("購入できるのは10個までです")
    end
  end
end
