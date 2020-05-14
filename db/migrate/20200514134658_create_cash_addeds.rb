class CreateCashAddeds < ActiveRecord::Migration[5.2]
  def change
    create_table :cash_addeds do |t|
      t.belongs_to :user
      t.float :charge
      t.timestamps
    end
  end
end
