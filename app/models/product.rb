# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :shopping_baskets
  belongs_to :category
  validates :category, presence: true
  validates :price, presence: true

  scope :by_category, ->(category_id) { where(category_id: category_id) }

  def to_s
    name
  end

  def belongs_to_user_shopping_basket(user)
    basket = ShoppingBasket.by_user(user.id).first
    if basket
      basket.products.include?(self)
    else
      false
    end
  end
end
