class RenameCategoryOfPlaces < ActiveRecord::Migration
	def up
		rename_column :places, :category, :classes
	end

	def down
		rename_column :places, :classes, :category
	end
end
