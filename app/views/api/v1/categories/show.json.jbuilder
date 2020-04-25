# frozen_string_literal: true

json.partial! 'category', category: @category
json.products @category.products do |product|
  json.partial! 'api/v1/products/product', product: product
end
