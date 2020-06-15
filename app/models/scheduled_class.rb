class ScheduledClass < ApplicationRecord
  belongs_to :member
  belongs_to :gym_class
  belongs_to :gym
end
