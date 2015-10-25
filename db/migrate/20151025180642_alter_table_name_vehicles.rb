class AlterTableNameVehicles < ActiveRecord::Migration
  def change
    rename_table :veichles, :vehicles
  end
end
