
module ParkingPayment
  module V1
    module Entities
      class VehicleEntity < Grape::Entity
        expose :identifier
        expose :vehicle_type, as: :type
        expose :created_at
        expose :updated_at
      end
    end
  end
end