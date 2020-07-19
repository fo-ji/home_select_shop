class CreateRecommends < ActiveRecord::Migration[5.2]
  def change
    create_table :recommends do |t|
      t.string     :name,          null: false
      t.string     :image,         null: false
      t.integer    :genre,         null: false, default: 0
      t.text       :introduction,  null: false
      t.text       :url
      t.references :user,          null: false, foreign_key: true
      t.references :community,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
