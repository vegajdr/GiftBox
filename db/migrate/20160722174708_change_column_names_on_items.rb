class ChangeColumnNamesOnItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :user_holidays_id, :user_holiday_id
    rename_column :items, :user_interests_id, :user_interest_id
  end
end
