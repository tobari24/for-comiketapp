class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
