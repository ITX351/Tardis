class RemoveImagesFromPlaces < ActiveRecord::Migration
	def up
		remove_column  :places, :image1
		remove_column  :places, :image2
		remove_column  :places, :image3	
	end

	def down
		add_column  :places, :image1
		add_column  :places, :image2
		add_column  :places, :image3
	end
end
