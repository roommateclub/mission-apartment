class AddStatusToMission < ActiveRecord::Migration
  def change
    add_column :missions, :status, :integer, default: 0
    add_index :missions, :status
  end
end
