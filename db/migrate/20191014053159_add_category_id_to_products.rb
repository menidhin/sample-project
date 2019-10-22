class AddCategoryIdToProducts < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :category_id, :integer, nil: false, index: true
  end
end
