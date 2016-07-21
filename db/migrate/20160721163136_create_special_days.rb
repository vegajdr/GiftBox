class CreateSpecialDays < ActiveRecord::Migration[5.0]
  def change
    create_table :special_days do |t|
      t.belongs_to :user, foreign_key: true
      t.string :sd_day
      t.string :sd_month
      t.string :sd_year
      t.string :name

      t.timestamps
    end
  end
end
