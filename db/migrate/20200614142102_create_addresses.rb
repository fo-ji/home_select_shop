class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,  null: false
      t.integer    :prefecture,   null: false, default: 1
      t.string     :city,         null: false
      t.string     :address,      null: false
      t.string     :apartment
      t.string     :phone_number, null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
