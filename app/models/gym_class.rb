class GymClass < ApplicationRecord
  belongs_to :gym
  has_many :scheduled_classes, dependent: :destroy
  has_many :members, through: :scheduled_classes

  scope :ordered, -> { order(name: :asc) }

  accepts_nested_attributes_for :scheduled_classes

  validates :name, :duration, :max_size, presence: true
  validates_uniqueness_of :name, scope: :gym_id, case_sensitive: false


end
