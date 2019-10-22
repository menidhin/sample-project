class Seller < ApplicationRecord
	# has_many :products

	has_many :products, :class_name => "Product", :foreign_key => :seller_id

	validates :seller_name, presence: true
	validates :country, presence: true
	
end
