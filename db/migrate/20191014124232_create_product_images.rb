class CreateProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images do |t|
    	t.integer :product_id, nil: false, index: true
    	t.attachment :image
      t.timestamps
    end
  end
end
