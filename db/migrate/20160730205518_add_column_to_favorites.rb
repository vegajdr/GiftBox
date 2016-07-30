class AddColumnToFavorites < ActiveRecord::Migration[5.0]
  def change
    add_column :favorites, :custom, :string
  end
end
