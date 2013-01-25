class PhoneNumber < ActiveRecord::Base
  attr_accessible :person_id, :phone_number
  
  belongs_to :person
end
