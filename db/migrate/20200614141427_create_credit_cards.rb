class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer    :card_company, null: false, default: 1
      t.string     :card_number,  null: false
      t.integer    :card_year,    null: false
      t.integer    :card_month,   null: false
      t.integer    :card_pass,    null: false
      t.string     :customer_id
      t.string     :card_id
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
