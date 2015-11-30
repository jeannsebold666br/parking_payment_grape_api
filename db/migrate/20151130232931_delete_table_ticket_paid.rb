class DeleteTableTicketPaid < ActiveRecord::Migration
  def change
    drop_table :ticket_paids
  end
end
