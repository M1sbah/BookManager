class AddCoverToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :cover, :text
  end
end
