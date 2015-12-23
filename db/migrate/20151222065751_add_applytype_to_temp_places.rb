class AddApplytypeToTempPlaces < ActiveRecord::Migration
  def change
  	add_column :temp_places, :applytype, :integer
  end
end
