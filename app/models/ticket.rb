class Ticket < ActiveRecord::Base
  belongs_to :vehicle
  has_one :ticket_paid
end
