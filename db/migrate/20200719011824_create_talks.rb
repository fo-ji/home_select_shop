class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.string     :talk
      t.string     :image
      t.references :community, null: false, foreign_key: true
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
