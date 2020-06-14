class ScheduledClass < ApplicationRecord
  belongs_to :member
  belongs_to :gym
  belongs_to :gym_class
  ###### DONT FORGET TO ADD ATTRIBUTE
end
