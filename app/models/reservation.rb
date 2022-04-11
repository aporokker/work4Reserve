class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :num_of_people, presence: true, numericality: { greater_than_or_equal_to:1, less_than_or_equal_to:10 }
  validate :enddate_after_startdate

  def enddate_after_startdate
    return if startdate.blank? || enddate.blank?
    errors.add(:enddate, "は開始日以降を入力してください") if enddate <= startdate
  end

  def total_price
    self.room.price * (self.enddate - self.startdate).to_i * self.num_of_people
  end
end
