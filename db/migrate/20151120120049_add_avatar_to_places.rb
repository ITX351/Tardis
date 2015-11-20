class AddAvatarToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :avatar, :string
  end
end
