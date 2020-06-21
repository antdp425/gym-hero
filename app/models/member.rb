class Member < ApplicationRecord
  belongs_to :gym
  has_many :scheduled_classes, dependent: :destroy
  has_many :gym_classes, through: :scheduled_classes

  scope :ordered, -> { order(last_name: :asc) }


  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :phone_number, length: {is: 10}, numericality: { only_integer: true , message: "only allows numbers" }

  validates_uniqueness_of :email, scope: :gym_id, case_sensitive: false
  

end

def full_name
  "#{last_name}, #{first_name}"
end
