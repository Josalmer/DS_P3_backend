# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :category
  validates :category, presence: true
  validates :price, presence: true

  scope :by_category, ->(category_id) { where(category_id: category_id) }

  def to_s
    name
  end
end
