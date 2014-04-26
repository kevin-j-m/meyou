class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer, index: true
      t.decimal :price

      t.timestamps
    end
  end
end
