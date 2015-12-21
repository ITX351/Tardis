class CreateTempPlaces < ActiveRecord::Migration
  def change
    create_table :temp_places do |t|
      t.string :name
      t.integer :classes
      t.float :locationx
      t.float :locationy
      t.text :intro
      t.string :avatar
      t.integer :user_id
      t.integer :place_id
      t.text :reason
      t.integer :state

      t.timestamps
    end
  end
end
