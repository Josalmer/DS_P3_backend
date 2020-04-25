# frozen_string_literal: true

json.categories @categories do |category|
  json.partial! 'category', category: category
end
