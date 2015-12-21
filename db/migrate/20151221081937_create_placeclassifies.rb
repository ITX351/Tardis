class CreatePlaceclassifies < ActiveRecord::Migration
  def change
    create_table :placeclassifies do |t|
      ## Database authenticatable
      t.string :name1, null: false, default: ""
      t.string :name2
      t.string :name3
      t.text :instruction

      t.timestamps
    end
    add_column :places, :placeclassify_id, :integer, :null => false, :default => 0
  end
end
