class CreateDances < ActiveRecord::Migration
  def self.up
    create_table :dances do |t|
      t.string :name
      t.string :type
      t.string :level
      t.string :info

      t.timestamps
    end
  end

  def self.down
    drop_table :dances
  end
end
