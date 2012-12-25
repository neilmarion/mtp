class Person < ActiveRecord::Base
  attr_accessible :birth_date, :first_name, :last_name, :middle_name, :office_id, :organization_id
  
  belongs_to :organization
  has_many :people_offices
  has_many :offices, :through => :people_offices
end
