class RemoveClassesFromPlaces < ActiveRecord::Migration
	def up
		remove_column :places, :classes
	end

	def down
		add_column :places, :classes
	end
end
