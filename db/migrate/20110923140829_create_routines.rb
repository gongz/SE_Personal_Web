class CreateRoutines < ActiveRecord::Migration
  def self.up
    create_table :routines do |t|
      t.integer :dance_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :routines
  end
end
