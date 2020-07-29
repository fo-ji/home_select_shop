class CoordinatePayment < ApplicationRecord
  belongs_to :coordinate
  belongs_to :user

  validates :purchase_amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :validate_purchase_amount_for_set

  private
  
  def validate_purchase_amount_for_set
    if self.purchase_amount.present?
      set = self.coordinate.set
      errors.add(:purchase_amount, "購入できるのは#{set}個までです") if self.purchase_amount > set
    end
  end
end
