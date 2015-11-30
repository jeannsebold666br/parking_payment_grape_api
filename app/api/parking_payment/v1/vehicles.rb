
class ParkingPayment::V1::Vehicles < Grape::API

  before do
    authenticated_user
  end

  helpers do
  end

  resource :vehicle do

    params do
      requires :vehicle_type, type: String, allow_blank: false, values: ['motorcycle', 'car']
      requires :identifier, type: String, allow_blank: false
    end
    post do
      params
    end
  end
end