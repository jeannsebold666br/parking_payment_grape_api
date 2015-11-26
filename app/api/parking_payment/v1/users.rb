
class ParkingPayment::V1::Users < Grape::API

  helpers do
  end

  resource :user do
    desc 'Create a user'
    params do
      requires :identifier, type: String, allow_blank: false, desc: 'Users identifier'
      optional :name, type: String, allow_blank: false, desc: 'User name'
    end
    post 'create' do

      usr= User.find_by identifier: params[:identifier]
      error! "User with identifier #{params[:identifier]} has already registered", 500 unless !usr

      usr= User.create params
      present usr, with: ParkingPayment::V1::Entities::UserEntity
    end

  end

end