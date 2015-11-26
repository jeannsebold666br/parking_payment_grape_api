
class API < Grape::API

  format :json

  helpers do

  end
  
  mount ParkingPayment::V1::Base

end