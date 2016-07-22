class AddNameColumnToWishlist < ActiveRecord::Migration[5.0]
  def change
    add_column :wishlists, :name, :string
  end
end
