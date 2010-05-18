class CreateFillups < ActiveRecord::Migration
  def self.up
    create_table :fillups do |t|
      t.float :miles_since_last_fillup
      t.float :gallons

      t.timestamps
    end
  end

  def self.down
    drop_table :fillups
  end
end
