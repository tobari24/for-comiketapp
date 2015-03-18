class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.references :user, index: true
      t.references :item, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
    add_foreign_key :orders, :items
  end
end
