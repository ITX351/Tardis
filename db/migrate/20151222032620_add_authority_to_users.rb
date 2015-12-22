class AddAuthorityToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :authority, :integer
  end
end
