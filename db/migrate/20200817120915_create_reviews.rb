class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :user_review
      t.integer :rating
      t.text :owner_comment
      t.references :booking, foreign_key: true
      t.timestamps
    end
  end
end
