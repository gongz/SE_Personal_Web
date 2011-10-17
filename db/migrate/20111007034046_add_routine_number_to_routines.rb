class AddRoutineNumberToRoutines < ActiveRecord::Migration
  def self.up
    add_column :routines, :routine_number, :integer
  end

  def self.down
    remove_column :routines, :routine_number
  end
end
