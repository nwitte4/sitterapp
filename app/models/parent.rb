class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_and_belongs_to_many :sitters
after_create :build_calendar

  def build_calendar
    Calendar.create(user_id: self.id)
    # Associations must be defined correctly for this syntax, avoids using ID's directly.
  end

end
