class AddColumnPriceTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :price, :float
  end
end
