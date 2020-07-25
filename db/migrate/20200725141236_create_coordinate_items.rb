class CreateCoordinateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinate_items do |t|
      t.references :coordinate, foreign_key: true, null: false
      t.references :item,       foreign_key: true, null: false
      t.timestamps
    end
  end
end
