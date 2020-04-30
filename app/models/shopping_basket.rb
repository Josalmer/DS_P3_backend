# frozen_string_literal: true

class ShoppingBasket < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  has_and_belongs_to_many :products

  scope :by_user, ->(user_id) { where(user_id: user_id) }

  def total_cost
    cost = 0
    products.each do |product|
      cost += product.price
    end
    cost
  end
end
