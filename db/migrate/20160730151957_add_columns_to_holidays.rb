class AddColumnsToHolidays < ActiveRecord::Migration[5.0]
  def change
    add_column :holidays, :holiday_day, :string
    add_column :holidays, :holiday_month, :string
    add_column :holidays, :holiday_year, :string
  end
end
