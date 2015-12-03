module ParkingPayment
  module V1
    module Entities
      class LoginEntity < Grape::Entity
        expose :token
        expose :user, using: ParkingPayment::V1::Entities::UserEntity
      end
    end
  end
end
