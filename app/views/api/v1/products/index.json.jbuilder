# frozen_string_literal: true

json.products @products do |product|
  json.partial! 'product', product: product
end
