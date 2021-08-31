class Day < ApplicationRecord
  has_many :reservations

  validates :capacity, numericality: { greater_than_or_equal_to: 0 }
  validate :date_before_start
  validate :start_time_not_sunday
  validate :start_time_not_monday

  def date_before_start
    errors.add('予約日は今日以前の日付を選択できません') if day.start_time <= Date.today
  end

  def start_time_not_sunday
    errors.add('予約日はは日曜日を選択できません') if day.start_time.sunday?
  end

  def start_time_not_monday
    errors.add('予約日はは月曜日を選択できません') if day.start_time.monday?
  end
end
