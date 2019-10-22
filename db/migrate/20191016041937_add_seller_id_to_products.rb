class AddSellerIdToProducts < ActiveRecord::Migration[5.1]
  def change
  	  	add_column :products, :seller_id, :integer, nil: false, index: true
  end
end
