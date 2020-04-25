# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :products
  include Attachable

  def to_s
    name
  end

  def image
    file_url.nil? ? default_image : file_url
  end
end
