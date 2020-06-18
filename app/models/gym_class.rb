class GymClass < ApplicationRecord
  belongs_to :gym
  has_many :scheduled_classes
  has_many :members, through: :scheduled_classes

  scope :ordered, -> { order(name: :asc) }

  accepts_nested_attributes_for :scheduled_classes

  validates :name, :duration, :max_size, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
