# frozen_string_literal: true

json.id product.id
json.name product.name
json.description product.description
json.price product.price
json.category_id product.category.id
json.belongs_to_user_shopping_basket product.belongs_to_user_shopping_basket(current_api_v1_user)
