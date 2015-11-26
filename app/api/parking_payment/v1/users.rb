
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

      error! "User with identifier #{params[:identifier]} has already registered", 500 unless User.find_by_identifier params[:identifier]

      user= Users.create params

      user

    end

  end

end