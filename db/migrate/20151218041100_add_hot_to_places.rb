class AddHotToPlaces < ActiveRecord::Migration
  def change
     add_column :places, :hot, :integer
  end
end
