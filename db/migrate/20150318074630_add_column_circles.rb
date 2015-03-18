class AddColumnCircles < ActiveRecord::Migration
  def change
  	add_column :circles, :date, :integer
  	add_column :circles, :space, :string
  end
end
