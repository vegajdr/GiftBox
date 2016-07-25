class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.integer :created_by
      t.string :email

      t.timestamps
    end
  end
end
