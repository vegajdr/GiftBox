class CreateHolidays < ActiveRecord::Migration[5.0]
  def change
    create_table :holidays do |t|
      t.string :name
      t.string :season

      t.timestamps
    end
  end
end
