class AlterColumnVeichlesIdFromTableTickets < ActiveRecord::Migration
  def change
    rename_column :tickets, :veichles_id, :vehicle_id
  end
end
