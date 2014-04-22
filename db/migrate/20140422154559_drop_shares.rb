class DropShares < ActiveRecord::Migration
  def change
    drop_table :shares
  end
end
