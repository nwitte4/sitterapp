class Gig < ApplicationRecord
  validates :description, presence: true
  validates :cost, presence: true
  validates :start_time, uniqueness: { scope: :end_time, message: "Start time and end time must be different." }


  validate :start_must_be_before_end_time

  private

  def start_must_be_before_end_time
   errors.add(:start_time, "must be before end time") unless
      start_time < end_time
  end

end
