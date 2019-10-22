class RenameProductsIdToProductId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :customers, :products_id, :product_id
  end
end
