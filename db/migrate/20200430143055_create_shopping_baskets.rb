class CreateShoppingBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_baskets do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end
