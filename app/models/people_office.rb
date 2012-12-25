class PeopleOffice < ActiveRecord::Base
  attr_accessible :office_id, :person_id
  
  belongs_to :person
  belongs_to :office
end
