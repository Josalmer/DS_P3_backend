# frozen_string_literal: true

json.id basket.id
json.user_id basket.user_id
json.user_name basket.user.name if basket.user
json.total_cost basket.total_cost
