class ItemPayment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :purchase_amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :validate_purchase_amount_for_stock

  private
  
  def validate_purchase_amount_for_stock
    if self.purchase_amount.present?
      stock = self.item.stock
      errors.add(:purchase_amount, "購入できるのは#{stock}個までです") if self.purchase_amount > stock
    end
  end
end
