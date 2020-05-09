# frozen_string_literal: true

json.id shopping_basket.id
json.user_id shopping_basket.user_id
json.user_name shopping_basket.user.name if shopping_basket.user
json.total_cost shopping_basket.total_cost
