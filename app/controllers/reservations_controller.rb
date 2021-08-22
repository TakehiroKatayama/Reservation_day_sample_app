class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    day_id = Day.find_by(reservation_date: params[:reservation][:day_id]).id
    # @reservation =
    Reservation.create!(reservation_params.merge(day_id: day_id))
    binding.pry
    # フォームに入力した予約テーブルに紐づく、ショップテーブルのカラム：キャパシティの値を呼び出す - フォームに入力した予約の人数
    # @capacity = @reservation.day.reservation_date.capacity.remaining_count - reservation_params[:count_person].to_i
    # 計算されたキャパシティーが0以上ならtrue
    # if @capacity >= 0
    # 変更されたshopのcapacityの値を更新
    # @reservation.day.reservation_date.capacity.update(remaining_count: @capacity)
    # redirect_to capacities_index_path
    # else
    # キャパシティがマイナスになる場合はfalse
    redirect_to action: :index
    # end
  end

  def edit; end

  def update; end

  private

  def reservation_params
    params.require(:reservation).permit(:count_person)
  end
end
