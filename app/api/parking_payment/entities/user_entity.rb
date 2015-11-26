module ParkingPayment
  module V1
    module Entities
      class UserEntity < Grape::Entity
        expose :name
        expose :identifier
        unexpose :created_at
        unexpose :updated_at
      end
    end
  end

end
