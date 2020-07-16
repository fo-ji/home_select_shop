class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string  :name,         null: false
      t.string  :email,        null: false, default: "", unique: true
      t.text    :avatar
      t.text    :introduction
      t.string  :postal_code,  null: false
      t.integer :prefecture,   null: false, default: 1
      t.string  :city,         null: false
      t.string  :address,      null: false
      t.string  :apartment
      t.string  :phone_number, null: false
      t.text    :official_site
      t.text    :facebook_account
      t.text    :line_account
      t.text    :instagram_account
      t.timestamps
    end

    add_index :shops, :name, unique: true
  end
end
