class Dogregistration < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :dog_name, presence: true

def full_name
  "#{first_name} #{last_name}"
end



end
