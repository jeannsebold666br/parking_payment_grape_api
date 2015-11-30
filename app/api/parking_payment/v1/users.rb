
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
      status 200
      {user: user, token: secret_key.token}
    end

    desc 'Login of user'
    params  do
      requires :email, type: String
      requires :password, type: String
    end
    post :signin do

      user = User.find_by_email params[:email]

      error! "Email #{params[:email]} or password is invalid", 500 unless user

      error!  "Email #{params[:email]} or password is invalid", 500 unless user.valid_password? params[:password]

      secret_key= generate_token_for_user user

      {token: secret_key.token}

    end
  end



end