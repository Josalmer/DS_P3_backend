class ChangeProductPriceToDouble < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, :float
  end
end
