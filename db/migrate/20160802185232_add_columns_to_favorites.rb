class AddColumnsToFavorites < ActiveRecord::Migration[5.0]
  def change
    add_column :favorites, :color_string, :string
    add_column :favorites, :animal_string, :string
    add_column :favorites, :restaurant_string, :string
    add_column :favorites, :season_string, :string
    add_column :favorites, :custom_string, :string
  end
end
