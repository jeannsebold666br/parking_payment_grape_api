
class ParkingPayment::V1::TicketVehicle < Grape::API
  helpers do

  end

  desc 'Create a ticket of vehicle'
  resource :ticket do
    params do
      requires :vehicle_id, type: Integer
    end
    post :create do

      error! "Vehicle with id #{params[:vehicle_id]} was not found", 500 unless Ticket.find_by params[:vehicle_id], paid: false
      params[:paid]= true
      Ticket.create params
    end
  end
end