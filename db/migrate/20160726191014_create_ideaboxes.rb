class CreateIdeaboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :ideaboxes do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :friend_id

      t.timestamps
    end
  end
end
