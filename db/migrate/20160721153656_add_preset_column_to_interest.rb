class AddPresetColumnToInterest < ActiveRecord::Migration[5.0]
  def change
    add_column :interests, :preset?, :boolean
  end
end
