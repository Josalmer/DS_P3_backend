# frozen_string_literal: true

json.partial! 'shopping_basket', shopping_basket: @basket
json.products @basket.products do |product|
  json.partial! 'api/v1/products/product', product: product
end
