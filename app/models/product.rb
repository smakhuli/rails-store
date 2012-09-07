class Product < ActiveRecord::Base
  acts_as_taggable

  has_many :discounts, :dependent => :destroy, :order => 'description ASC'

  # line below used for filtering on product_type
  TYPES = %w[Low Medium High]

  serialize :category

  # line below used for filtering on product_type
  scope :product_type, lambda { |product_type| where(:product_type => product_type) }

  validate :art_category_validations, :media_category_validations, :food_category_validations, :other_category_validations
  validates_presence_of :name, :price, :category
  # line below used for filtering on product_type
  validates_inclusion_of :product_type, :in => TYPES

  attr_accessible :name, :price, :product_type, :tag_list, :photo, :discounts_attributes, :category, :expiration_date, :art_information, :food_information, :media_information, :other_information
  accepts_nested_attributes_for :discounts, allow_destroy: true

  mount_uploader :photo, PhotoUploader

  def self.duplicate(id)
    product = Product.find(id)
    new_product = product.dup :include => :discounts
    new_product.name += " (Copy)"
    new_product.save!
  end

  def art_category_validations
    if category.include?("Art")
      errors.add(:art_information, "can't be blank") if art_information.blank?
    end
  end

  def media_category_validations
    if category.include?("Media")
      errors.add(:media_information, "can't be blank") if media_information.blank?
    end
  end

  def food_category_validations
    if category.include?("Food")
      errors.add(:food_information, "can't be blank") if food_information.blank?
    end
  end

  def other_category_validations
    if category.include?("Other")
      errors.add(:other_information, "can't be blank") if other_information.blank?
    end
  end

end