class Gym < ApplicationRecord
   has_secure_password
   has_many :members
   has_many :gym_classes
   has_many :scheduled_classes

   validates :email, presence: true
   validates :email, uniqueness: { case_sensitive: false }

end
