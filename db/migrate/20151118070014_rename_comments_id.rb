class RenameCommentsId < ActiveRecord::Migration
  def up
  	rename_column :comments, :article_id, :place_id
  end

  def down
  	rename_column :comments, :place_id, :article_id
  end
end
