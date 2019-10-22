class CreateSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|
    	t.string :seller_name, nil: false
      t.text :country
      t.references :product
      t.timestamps
    end
  end
end
