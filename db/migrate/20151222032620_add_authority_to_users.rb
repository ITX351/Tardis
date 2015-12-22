class AddAuthorityToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :authority, :integer, null: false, default: 0
  end
end
