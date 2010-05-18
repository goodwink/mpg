class AddMpgToFillup < ActiveRecord::Migration
  def self.up
    add_column :fillups, :mpg, :float
  end

  def self.down
    remove_column :fillups, :mpg
  end
end
