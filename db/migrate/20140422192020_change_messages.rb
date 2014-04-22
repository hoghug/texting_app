class ChangeMessages < ActiveRecord::Migration
  def change
    change_column(:messages, :recipient_id, :string)
  end
end
