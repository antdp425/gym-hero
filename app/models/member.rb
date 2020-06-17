class Member < ApplicationRecord
  belongs_to :gym
  has_many :scheduled_classes
  has_many :gym_classes, through: :scheduled_classes

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :email, uniqueness: { case_sensitive: false }
  validates :phone_number, length: {is: 10}, numericality: { only_integer: true , message: "only allows numbers" }

end
