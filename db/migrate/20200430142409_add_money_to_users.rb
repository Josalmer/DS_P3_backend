class AddMoneyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :money, :float, default: 0
  end
end
