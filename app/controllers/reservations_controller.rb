class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.order(id: 'DESC')
    @days = Day.all
  end

  def new
    @reservation = Reservation.new
    # session[:previous_url] = request.referer
  end

  def create
    ActiveRecord::Base.transaction do
      day_id = Day.find_by(start_time: params[:reservation][:day_id]).id
      @reservation = Reservation.create!(reservation_params.merge(day_id: day_id))
      # フォームに入力した予約テーブルに紐づく、daysテーブルのカラム：キャパシティの値を呼び出す - フォームに入力した予約の人数
      seats = @reservation.day.capacity - reservation_params[:count_person].to_i
      # 変更されたshopのcapacityの値を更新
      @reservation.day.update!(capacity: seats)
      # redirect_to session[:previous_url]
      redirect_to root_path
    end
  rescue StandardError => e
    redirect_to action: :index
  end

  def edit
    @reservation = Reservation.find(params[:id])
    # session[:previous_url] = request.referer
  end

  def update
    ActiveRecord::Base.transaction do
      reservation = Reservation.find(params[:id])
      current_person = reservation.count_person
      reservation.update!(reservation_params)
      edit_capacity = reservation.day.capacity - (reservation_params[:count_person].to_i - current_person)
      reservation.day.update!(capacity: edit_capacity)
      # redirect_to session[:previous_url]
      redirect_to root_path
    end
  rescue StandardError => e
    redirect_to action: :index
  end

  def day_edit
    @reservation = Reservation.find(params[:id])
    @days = Day.all
  end

  def day_update
    # 日程変更をする予約を呼び出す
    reservation = Reservation.find(params[:id])
    # 予約されていた人数分のキャパシティーを戻す
    return_capacity = reservation.day.capacity + reservation.count_person
    # 予約の日程のキャパシティーを更新する
    reservation.day.update!(capacity: return_capacity)
    # フォームに送信されたday_idの値を更新する
    reservation.update!(reservation_params)
    # day_idを更新した予約���呼び出す
    update_reservation = Reservation.find(params[:id])
    # 更新した予約に紐づく日程のキャパシティーから予約人数をマイナスする
    edit_capacity = update_reservation.day.capacity - update_reservation.count_person
    更新した予約に紐����日程のキャパシティーを更新する
    update_reservation.day.update(capacity: edit_capacity)
    # redirect_to session[:previous_url]
    redirect_to root_path
  end

  def cancel
    # キャ���セル処理を行う予約を呼び出す
    @reservation = Reservation.find(params[:id])
    # キャンセル人数を予約日のCapacityにプラスする
    new_seats = @reservation.count_person + @reservation.day.capacity
    # 予約日のCapacityを更新
    @reservation.day.update!(capacity: new_seats)
    # 予約の人数を0にする
    # new_count_person = @reservation.count_person - @reservation.count_person
    # ステータスをキャンセル済に更新
    @reservation.update!(status: 2)
    redirect_back(fallback_location: root_path)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:count_person, :email, :day_id, :user_id, :status)
  end
end
