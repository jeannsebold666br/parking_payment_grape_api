class UserController < ApplicationController
  require 'securerandom'

  def create

    user = User.create(name: SecureRandom.hex, identifier: SecureRandom.hex )
    vehicle = Vehicle.create(vehicle_type: "car", identifier: SecureRandom.hex, user_id: user.id)

    redirect_to "/#{vehicle.id}/ticket/create"
  end
end
