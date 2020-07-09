class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string     :name,          null: false
      t.integer    :price,         null: false
      t.text       :explain,       null: false
      t.integer    :size,          null: false, default: 4
      t.integer    :postage,       null: false, default: 1
      t.integer    :shipping_date, null: false, default: 1
      t.integer    :gender,        null: false, default: 1
      t.integer    :stock,         null: false, default: 1
      t.references :user,          null: false, foreign_key: true
      t.references :shop,          null: false, foreign_key: true
      t.references :brand,         null: false, foreign_key: true
      t.references :category,      null: false, foreign_key: true
      t.timestamps
    end

    add_index :items, :name, unique: true
    add_index :items, :price
    add_index :items, :size
    add_index :items, :gender
  end
end
