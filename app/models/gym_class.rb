class GymClass < ApplicationRecord
  belongs_to :gym
  has_many :scheduled_classes
  has_many :members, through: :scheduled_classes
end
