class AddCustomerIdToProduct < ActiveRecord::Migration[5.1]
  def change
  	add_reference :customers, :products, index: true
  end
end
