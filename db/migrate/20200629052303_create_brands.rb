class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.integer :brand, null: false, default: 0
      t.timestamps
    end

    add_index :brands, :brand
  end
end
