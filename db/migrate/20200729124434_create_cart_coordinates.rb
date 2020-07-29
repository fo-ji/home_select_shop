class CreateCartCoordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_coordinates do |t|
      t.integer    :quantity,   default: 1
      t.references :coordinate, null: false, foreign_key: true
      t.references :cart,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
