require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  describe '#create' do
    it "全て入力されていればOK" do
      credit_card = build(:credit_card)
      expect(credit_card).to be_valid
    end
    it "customer_idが空ならNG" do
      credit_card = build(:credit_card, customer_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("を入力してください")
    end
    it "card_idが空ならNG" do
      credit_card = build(:credit_card, card_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("を入力してください")
    end
    it "uer_idが空でもOK" do
      credit_card = build(:credit_card, user: nil)
      expect(credit_card).to be_valid
    end
  end
end
