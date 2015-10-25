class CreateTicketPaids < ActiveRecord::Migration
  def change
    create_table :ticket_paids do |t|
      t.belongs_to :ticket, index: true, foreign_key: true
      t.float :price
      t.date :paidDate
      t.timestamps null: false
    end
  end
end
