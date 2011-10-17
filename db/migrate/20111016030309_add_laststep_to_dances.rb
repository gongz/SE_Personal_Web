class AddLaststepToDances < ActiveRecord::Migration
  def self.up
    add_column :dances, :laststep, :boolean
  end

  def self.down
    remove_column :dances, :laststep
  end
end
