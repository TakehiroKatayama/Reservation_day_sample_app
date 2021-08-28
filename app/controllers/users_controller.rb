class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reservations = @user.reservations
  end
end
