
class ParkingPayment::V1::Users < Grape::API

  helpers do
    def generate_token_for_user usr
      token= UserToken.create token: SecureRandom.base64, user_id: usr.id
    end
  end

  resource :user do
    desc 'Create a user'
    params do
      requires :identifier, type: String, allow_blank: false, desc: 'Users identifier'
      requires :email, type: String, allow_blank: false, desc: 'Users email'
      optional :name, type: String, allow_blank: false, desc: 'User name'
      requires :password, type: String, length:8, allow_blank: false, desc: 'User password'
    end
    post 'create' do

      error! "User with email #{params[:email]} has already registered", 500 if User.find_by email: params[:email]

      user= User.create params

      secret_key= generate_token_for_user user
      result= {user: user, token: secret_key.token}
      result
      # present result, with: ParkingPayment::V1::Entities::LoginEntity
    end

  end

end