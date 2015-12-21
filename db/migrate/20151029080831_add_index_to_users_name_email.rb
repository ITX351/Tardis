class AddIndexToUsersNameEmail < ActiveRecord::Migration
	def change
		add_index :users, :name, unique: true
		add_index :users, :email, unique: true
	end
end
