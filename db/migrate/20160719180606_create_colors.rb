class CreateColors < ActiveRecord::Migration[5.0]
  def change
    create_table :colors do |t|
      t.string :hex
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
