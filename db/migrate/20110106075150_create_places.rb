class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
