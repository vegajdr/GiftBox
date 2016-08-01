class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.belongs_to :ideabox, foreign_key: true
      t.string :text
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
