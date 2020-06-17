class Member < ApplicationRecord
  belongs_to :gym
  has_many :scheduled_classes
  has_many :gym_classes, through: :scheduled_classes

  
end
