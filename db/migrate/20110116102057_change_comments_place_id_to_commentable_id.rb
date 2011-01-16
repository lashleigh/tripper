class ChangeCommentsPlaceIdToCommentableId < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.rename :place_id, :commentable_id
      t.rename :body, :content
      t.column :commentable_type, :string
    end
  end

  def self.down
    change_table :comments do |t|
      t.rename :commentable_id, :place_id
      t.rename :content, :body 
      t.remove :commentable_type
    end
  end
end
