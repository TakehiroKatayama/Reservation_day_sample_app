class DaysController < ApplicationController
  def index
    @days = Day.all
  end

  def show
    @day = Day.find(params[:id])
  end

  private

  def shop_params
    params.require(:day).permit(:capacity, :reservation_day)
  end
end
