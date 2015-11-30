
class ParkingPayment::V1::Vehicles < Grape::API

  before do
    authenticated_user?
  end

  helpers do
  end

  resource :vehicle do

    desc 'Create a vehicle'
    params do
      requires :vehicle_type, type: String, allow_blank: false, values: ['motorcycle', 'car','bus']
      requires :identifier, type: String, allow_blank: false
    end
    post do
      error! "Vehicle with identifier #{params[:identifier]} is already registered", 500 if Vehicle.find_by identifier: params[:identifier], user_id: @current_user.id

      params[:user_id]= @current_user.id
      vehicle= Vehicle.create params
      # present vehicle, with: ParkingPayment::V1::Entities::VehicleEntity
    end

    desc 'List all vehicles from user'
    get :all do
      vehicles= Vehicle.where user_id: @current_user.id
      # present vehicles, with: ParkingPayment::V1::Entities::VehicleEntity
    end
  end
end