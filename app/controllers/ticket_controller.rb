class TicketController < ApplicationController

  def create
    vehicle_id = params[:vehicle_id]
    vehicle = Vehicle.find vehicle_id
    ticket = Ticket.create(vehicle_id: vehicle_id, user_id:vehicle.user_id)

    redirect_to "/#{ticket.id}/barcode/create"
  end
end
