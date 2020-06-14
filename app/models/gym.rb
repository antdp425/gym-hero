class Gym < ApplicationRecord
   has_many :members
   has_many :gym_classes
   has_many :scheduled_classes
end
