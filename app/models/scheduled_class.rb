class ScheduledClass < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :gym_class
  belongs_to :gym

  validates :time, presence: true, uniqueness: true
  # validates_uniqueness_of :member_id, scope: [:gym_class_id, :time]  
end
