class Discount < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :description, :price
  attr_accessible :description, :price, :product_id
  
end
