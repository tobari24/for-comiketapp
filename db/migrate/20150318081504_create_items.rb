class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :itemname
      t.integer :price
      t.references :circle, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :circles
  end
end
