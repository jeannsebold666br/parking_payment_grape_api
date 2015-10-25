class TicketController < ApplicationController

  def create
    vehicle_id = params[:vehicle_id]
    vehicle = Vehicle.find vehicle_id
    ticket = Ticket.create(vehicle_id: vehicle_id, user_id:vehicle.user_id)
    render json: {status: "Create ticket # #{ticket.id}"}
  end
end
