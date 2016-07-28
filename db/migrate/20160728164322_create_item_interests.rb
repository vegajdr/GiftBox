class CreateItemInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :item_interests do |t|
      t.belongs_to :item, foreign_key: true
      t.belongs_to :user_interest, foreign_key: true

      t.timestamps
    end
  end
end
