class AddNumberToRoutines < ActiveRecord::Migration
  def self.up
    add_column :routines, :number, :integer
  end

  def self.down
    remove_column :routines, :number
  end
end
