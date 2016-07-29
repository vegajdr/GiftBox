class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, foreign_key: true
      t.string :color
      t.string :animal
      t.string :season
      t.string :restaurant

      t.timestamps
    end
  end
end
