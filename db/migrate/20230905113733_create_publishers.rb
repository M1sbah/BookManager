class CreatePublishers < ActiveRecord::Migration[7.0]
  def change
    create_table :publishers do |t|
      t.string :publish
      t.text :address
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
