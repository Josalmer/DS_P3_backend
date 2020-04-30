class CreateShoppingBasketProductsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :shopping_baskets
  end
end
