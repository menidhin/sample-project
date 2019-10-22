class Product < ApplicationRecord

	belongs_to :category
	# belongs_to :seller

	belongs_to :seller, :class_name => "Seller", :foreign_key => :seller_id, optional: false

	has_many :product_images
	has_many :customers
	has_many :reviews

	validates :name, presence: true
	validates :price, presence: true, numericality: { only_integer: true }
	validates :product_type, presence: true
	
end
