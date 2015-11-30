module ParkingPayment
  module V1
    class Base < Grape::API
      prefix 'api'
      version 'v1', using: :path

      helpers do
        def authenticated_user?
          error! 'Unauthorized. Invalid or expired token.', 401 unless current_user
        end

        def current_user
          token = UserToken.find_by_token headers['Token']
          if token
            @current_user = User.find token.user_id
          else
            false
          end
        end
      end

      mount Users
      mount Vehicles
      mount TicketVehicle

      route :any, '*path' do
        error!('This is not the endpoint you\'re looking for!', 404)
      end

    end
  end
end