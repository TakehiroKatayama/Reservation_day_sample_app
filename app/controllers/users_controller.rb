class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    # @reservations = @user.reservations.includes(:day)
    @reservations = current_user.reservations.includes(:day)
  end
end
