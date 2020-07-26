class CreateCoordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinates do |t|
      t.string     :name,          null: false
      t.integer    :total_price,   null: false
      t.integer    :set,           null: false, default: 1
      t.text       :explain,       null: false
      t.integer    :postage,       null: false, default: 1
      t.integer    :shipping_date, null: false, default: 1
      t.integer    :gender,        null: false, default: 1
      t.text       :image,         null: false
      t.references :user,          null: false, foreign_key: true
      t.references :shop,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
