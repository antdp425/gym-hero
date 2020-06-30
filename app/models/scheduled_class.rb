class ScheduledClass < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :gym_class
  belongs_to :gym

  scope :todays_classes, -> { where(time: DateTime.current..DateTime.current.end_of_day).distinct.where(member_id: nil).order(time: :asc) }

  scope :upcoming_classes, -> { where("time >= ?", DateTime.current).where("member_id IS ?", nil).order(time: :asc) }

  scope :this_session, ->(time = params[:time].to_datetime) {where("time = ?", time)}
  

  validates :time, presence: true
  validates_uniqueness_of :time, scope: [:gym_class_id, :member_id], message: "already taken and/or member is already in this scheduled class"


  def time_only
    time.strftime("%I:%M %p")
  end

  def full_time
    time.strftime("%B %d, %Y at %I:%M %p")
  end

end