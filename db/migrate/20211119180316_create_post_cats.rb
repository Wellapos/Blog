class CreatePostCats < ActiveRecord::Migration[6.1]
  def change
    create_table :post_cats do |t|
      t.references :post, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
