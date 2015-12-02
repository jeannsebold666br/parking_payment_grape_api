
class API < Grape::API

  format :json
  require_relative '../parking_payment/validations/length'
  helpers do

  end
  
  mount ParkingPayment::V1::Base

end