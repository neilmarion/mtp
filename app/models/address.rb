class Address < ActiveRecord::Base
  attr_accessible :address, :longitude, :latitude
  
  belongs_to :person
end
