class GymClass < ApplicationRecord
  belongs_to :gym
  has_many :scheduled_classes
  has_many :members, through: :scheduled_classes

  accepts_nested_attributes_for :scheduled_classes

  validates :name, :duration, :max_size, presence: true
end
