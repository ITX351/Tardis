class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.integer :category
      t.float :locationx
      t.float :locationy
      t.text :intro
      t.string :image1
      t.string :image2
      t.string :image3

      t.timestamps
    end
  end
end
