class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :purchased?, default: false
      t.belongs_to :wishlist, foreign_key: true
      t.belongs_to :user_interests, foreign_key: true
      t.belongs_to :user_holidays, foreign_key: true

      t.timestamps
    end
  end
end
