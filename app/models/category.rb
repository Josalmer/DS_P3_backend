# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :products
  include Attachable

  def to_s
    name
  end

  def logo
    file_url.nil? ? default_logo : file_url
  end
end
