class Address < ActiveRecord::Base
  attr_accessible :address
  
  belongs_to :person
end
