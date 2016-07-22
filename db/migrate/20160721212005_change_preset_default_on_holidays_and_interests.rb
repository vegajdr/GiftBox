class ChangePresetDefaultOnHolidaysAndInterests < ActiveRecord::Migration[5.0]
  def change
    change_column_default :holidays, :preset?, false
    change_column_default :interests, :preset?, false
  end
end
