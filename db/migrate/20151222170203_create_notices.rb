class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.integer :infotype
      t.integer :admin_id
      t.integer :user_id
      t.integer :place_id
      t.integer :temp_place_id

      t.timestamps
    end
  end
end
