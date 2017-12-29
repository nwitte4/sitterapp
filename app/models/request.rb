class Request < ApplicationRecord
  validates :cost, presence: true


  validate :start_must_be_before_end_time

  private

  def start_must_be_before_end_time
   errors.add(:start_time, "must be before end time") unless
      start_time < end_time
  end
end
