class Gym < ApplicationRecord
   has_secure_password
   has_many :members
   has_many :gym_classes
   has_many :scheduled_classes

   validates :name, format: { with: /[a-zA-Z0-9]/, message: "can only include letters and numbers"}
   validates :email, presence: true
   validates :email, uniqueness: { case_sensitive: false }

end
