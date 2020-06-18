class ScheduledClass < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :gym_class
  belongs_to :gym

  scope :todays_classes, -> { where(time:DateTime.current..DateTime.current.end_of_day).distinct.where(member_id: nil) }

  validates :time, presence: true
  validates_uniqueness_of :time, scope: [:gym_class_id, :member_id], message: "already taken and/or member is already in this scheduled class"

end