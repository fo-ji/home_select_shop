class CreateItemPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :item_payments do |t|
      t.integer    :purchase_amount, null: false
      t.string     :charge_id
      t.references :user,            null: false, foreign_key: true
      t.references :item,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
