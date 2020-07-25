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
      t.timestamps
    end
  end

  # add_index :coordinates, :name, unique: true
end
