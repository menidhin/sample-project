class ChangeReviewBodyTextDatatype < ActiveRecord::Migration[5.1]
  def change
  	change_column :reviews, :review_body, :text, null: true
  end
end
