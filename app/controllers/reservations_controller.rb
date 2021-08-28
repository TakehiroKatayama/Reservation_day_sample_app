class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order(id: 'DESC')
    @days = Day.all
  end

  def new
    @reservation = Reservation.new
    session[:previous_url] = request.referer
  end

  def create
    day_id = Day.find_by(start_time: params[:reservation][:day_id]).id
    @reservation = Reservation.create!(reservation_params.merge(day_id: day_id))
    # フォームに入力した予約テーブルに紐づく、daysテーブルのカラム：キャパシティの値を呼び出す - フォームに入力した予約の人数
    seats = @reservation.day.capacity - reservation_params[:count_person].to_i
    # 計算されたキャパシティーが0以上ならtrue
    if seats >= 0
      # 変更されたshopのcapacityの値を更新
      @reservation.day.update(capacity: seats)
      redirect_to session[:previous_url]
    else
      # キャパシティがマイナスになる場合はfalse
      redirect_to action: :index
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    session[:previous_url] = request.referer
  end

  def update
    reservation = Reservation.find(params[:id])
    current_person = reservation.count_person
    reservation.update!(reservation_params)
    edit_capacity = reservation.day.capacity - (reservation_params[:count_person].to_i - current_person)
    if edit_capacity >= 0
      reservation.day.update(capacity: edit_capacity)
      redirect_to session[:previous_url]
    else
      redirect_to root_path
    end
  end

  def cancel
    # キャンセル処理を行う予約を呼び出す
    @reservation = Reservation.find(params[:id])
    # キャンセル人数を予約日のCapacityにプラスする
    new_seats = @reservation.count_person + @reservation.day.capacity
    # 予約日のCapacityを更新
    @reservation.day.update!(capacity: new_seats)
    # 予約の人数を0にする
    new_count_person = @reservation.count_person - @reservation.count_person
    # 予約人数を0人で更新
    @reservation.update!(count_person: new_count_person)
    redirect_back(fallback_location: root_path)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:count_person, :email, :day_id, :user_id, :status)
  end
end
