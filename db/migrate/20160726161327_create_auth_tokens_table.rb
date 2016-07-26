class CreateAuthTokensTable < ActiveRecord::Migration[5.0]
  def change
    create_table :auth_tokens do |t|
      t.belongs_to :user, foreign_key: true
      t.string :nonce, index: true, unique: true
      t.string :name
      t.datetime :expires_at
      t.datetime :deleted_at

      t.timestamps
    end

    add_column :users, :facebook_token, :string
    add_column :users, :facebook_data, :json
  end
end
