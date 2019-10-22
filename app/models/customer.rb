class Customer < ApplicationRecord

	belongs_to :product

	validates :product_id, presence: true
	validates :customer_name, presence: true
	validates :city, presence: true
	
end
