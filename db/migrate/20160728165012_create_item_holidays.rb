class CreateItemHolidays < ActiveRecord::Migration[5.0]
  def change
    create_table :item_holidays do |t|
      t.belongs_to :item, foreign_key: true
      t.belongs_to :user_holiday, foreign_key: true

      t.timestamps
    end
  end
end
