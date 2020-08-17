class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.integer :price_per_day
      t.string :image_url
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
