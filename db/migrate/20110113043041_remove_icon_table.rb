class RemoveIconTable < ActiveRecord::Migration
  def self.up
    drop_table :icons
  end

  def self.down
    create_table :icons
  end
end
