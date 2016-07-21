class AddPresetColumnToColor < ActiveRecord::Migration[5.0]
  def change
    add_column :colors, :preset?, :boolean
  end
end
