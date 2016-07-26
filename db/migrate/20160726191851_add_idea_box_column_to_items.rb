class AddIdeaBoxColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :ideabox, foreign_key: true
  end
end
