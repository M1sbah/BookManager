class CreateCategoryBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :category_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
