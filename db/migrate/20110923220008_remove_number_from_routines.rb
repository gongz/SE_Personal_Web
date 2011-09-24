class RemoveNumberFromRoutines < ActiveRecord::Migration
  def self.up
    remove_column :routines, :number
  end

  def self.down
    add_column :routines, :number, :integer
  end
end
