class ScheduledClass < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :gym_class
  belongs_to :gym

  validates :time, presence: true, uniqueness: true
end
