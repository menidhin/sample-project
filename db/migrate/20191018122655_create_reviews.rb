class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
	    t.integer :product_id, nil: false, index: true
	    t.integer :user_id, nil: false, index: true
	    t.integer :number_of_stars, :default => 1
	    t.string :review_body
	    t.timestamps
    end
  end
end
