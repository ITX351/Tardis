class AddImagenameToPlaceclassifies < ActiveRecord::Migration
	def change
		add_column :placeclassifies, :imagename, :string, null: false, default: ""
	end
end
