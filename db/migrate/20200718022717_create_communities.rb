class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name,         null: false
      t.string :owner,        null: false, unique: true
      t.text   :avatar,       null: false
      t.text   :introduction, null: false
      t.timestamps
    end

    add_index :communities, :name, unique: true
  end
end
