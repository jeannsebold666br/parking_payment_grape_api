
class ParkingPayment::V1::Tickets < Grape::API

  before do
    authenticated_user?
  end

  helpers do
    def vehicle_exists? vehicle_id
      vehicle= Vehicle.find_by user_id: @current_user.id,id: vehicle_id
      error! "Vehicle with id #{params[:vehicle_id]} was not found", 500 unless !vehicle
    end

    def vehicles_has_pending? vehicle_id
      ticket= Ticket.find_by vehicle_id: vehicle_id, paid: false
      error! "There is a ticket to be paid for the vehicle with id #{params[:vehicle_id]}", 500 unless ticket
      ticket
    end


  end

  desc 'Create a ticket of vehicle'
  resource :ticket do
    params do
      requires :vehicle_id, type: Integer
    end
    post do
      vehicle_exists? params[:vehicle_id]
      vehicles_has_pending? params[:vehicle_id]
      params[:user_id]= @current_user.id
      params[:paid]= false
      Ticket.create params
    end

    params do
      requires :ticket_id, type: Integer
      requires :vehicle_id, type: Integer
    end
    post :pay do
      vehicle= vehicle_exists? params[:vehicle_id]

      ticket= Ticket.find_by id: params[:ticket_id], vehicle_id: params[:vehicle_id], paid: false
      error! "There is a ticket to be paid for the vehicle with id #{params[:vehicle_id]}", 500 unless !ticket
      ticket.paid= true
      ticket.update!
    end

  end
end