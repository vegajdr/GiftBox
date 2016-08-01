class RemoveColumFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :user_interest_id, :integer
    remove_column :items, :user_holiday_id, :integer
    remove_column :items, :ideabox_id, :integer
  end
end
