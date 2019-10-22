class RemoveProductIdFromSellers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :sellers, :product_id
  end
end
